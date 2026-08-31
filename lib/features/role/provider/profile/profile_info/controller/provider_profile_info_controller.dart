import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:care_bridge/features/role/provider/profile/profile_info/model/provider_profile_info_model.dart';

class ProviderProfileInfoController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController locationController;
  late TextEditingController descriptionController;

  final RxList<DayAvailability> availabilities = <DayAvailability>[].obs;
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> selectedImage = Rx<File?>(null);

  final List<String> timeSlots = const [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
  ];

  @override
  void onInit() {
    super.onInit();
    // nameController = TextEditingController(text: 'Dr Sarah Chen');
    // emailController = TextEditingController(text: 'david.william@email.com');
    // locationController = TextEditingController(text: 'San Francisco, CA');
    // descriptionController = TextEditingController(
    //   text: 'Passionate about health and nutrition, helping clients achieve their wellness goals.',
    // );
    nameController = TextEditingController();
    emailController = TextEditingController();
    locationController = TextEditingController();
    descriptionController = TextEditingController();

    // Default availabilities
    availabilities.assignAll([
      const DayAvailability(dayName: 'Sunday', isAvailable: true, fromTime: '09:00 AM', toTime: '05:00 PM'),
      const DayAvailability(dayName: 'Monday', isAvailable: true, fromTime: '09:00 AM', toTime: '05:00 PM'),
      const DayAvailability(dayName: 'Tuesday', isAvailable: true, fromTime: '09:00 AM', toTime: '05:00 PM'),
      const DayAvailability(dayName: 'Wednesday', isAvailable: true, fromTime: '09:00 AM', toTime: '05:00 PM'),
      const DayAvailability(dayName: 'Thursday', isAvailable: true, fromTime: '09:00 AM', toTime: '05:00 PM'),
      const DayAvailability(dayName: 'Friday', isAvailable: true, fromTime: '09:00 AM', toTime: '05:00 PM'),
      const DayAvailability(dayName: 'Saturday', isAvailable: false, fromTime: null, toTime: null),
    ]);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void toggleAvailability(int index, bool value) {
    final current = availabilities[index];
    availabilities[index] = current.copyWith(
      isAvailable: value,
      fromTime: value ? (current.fromTime ?? '09:00 AM') : null,
      toTime: value ? (current.toTime ?? '05:00 PM') : null,
    );
  }

  void updateFromTime(int index, String? value) {
    availabilities[index] = availabilities[index].copyWith(fromTime: value);
  }

  void updateToTime(int index, String? value) {
    availabilities[index] = availabilities[index].copyWith(toTime: value);
  }

  void updateProfile() async {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty) {
      EasyLoading.showError('Please fill in all required fields');
      return;
    }

    EasyLoading.show(status: 'Updating Profile...');
    await Future.delayed(const Duration(seconds: 1));
    EasyLoading.showSuccess('Profile updated successfully!');
    Get.back();
  }

  Future<void> onEditAvatar() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
      EasyLoading.showToast('Avatar selected');
    }
  }
}
