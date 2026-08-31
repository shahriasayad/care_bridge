import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/controller/user_profile_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/model/user_profile_model.dart';

class UserProfileInfoController extends GetxController {
  final nameController = TextEditingController();
  final dobController = TextEditingController(text: 'May 14, 1992');
  final selectedGender = 'Male'.obs;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Prefill user details if available from the main profile controller
    if (Get.isRegistered<UserProfileController>()) {
      final mainController = Get.find<UserProfileController>();
      nameController.text = mainController.user.value.name;
      emailController.text = mainController.user.value.email;
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1992, 5, 14),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryButtonColor,
              onPrimary: Colors.white,
              onSurface: AppColors.primaryTextColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      dobController.text = "${months[picked.month - 1]} ${picked.day}, ${picked.year}";
    }
  }

  void updateProfile() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading.value = false;

    // Update main user profile controller details
    if (Get.isRegistered<UserProfileController>()) {
      final mainController = Get.find<UserProfileController>();
      mainController.user.value = UserProfileModel(
        name: nameController.text.trim().isNotEmpty
            ? nameController.text.trim()
            : mainController.user.value.name,
        email: emailController.text.trim().isNotEmpty
            ? emailController.text.trim()
            : mainController.user.value.email,
        avatarUrl: mainController.user.value.avatarUrl,
      );
    }

    Get.back();
    Get.snackbar(
      'Success',
      'Profile updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    dobController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
