import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserTicketsController extends GetxController {
  final subjectController = TextEditingController(text: 'I was double charged this month');
  final descriptionController = TextEditingController();
  
  final preferredContactMethod = 'Email'.obs; // 'Email' or 'Phone'
  final attachments = <String>[].obs;
  
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final String? categoryTitle = Get.arguments as String?;
    if (categoryTitle != null) {
      subjectController.text = 'Issue with $categoryTitle';
    }
  }

  void selectContactMethod(String method) {
    preferredContactMethod.value = method;
  }

  void addAttachment() {
    // Mock attachment selection
    attachments.add('screenshot_${attachments.length + 1}.png');
    Get.snackbar(
      'Attachment',
      'Attachment added successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeAttachment(int index) {
    attachments.removeAt(index);
  }

  void submitTicket() async {
    if (subjectController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a subject',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }
    
    isLoading.value = true;
    // Simulate API delay (4 seconds)
    await Future.delayed(const Duration(seconds: 4));
    isLoading.value = false;

    Get.offNamed(AppRoutes.myTicketsListScreen);
    Get.snackbar(
      'Success',
      'Ticket submitted successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );
  }

  @override
  void onClose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
