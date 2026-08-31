import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  final RxBool isCurrentObscure = true.obs;
  final RxBool isNewObscure = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }

  void toggleCurrent() => isCurrentObscure.toggle();
  void toggleNew() => isNewObscure.toggle();

  String? validateCurrent(String? v) {
    if (v == null || v.isEmpty) return 'Current password is required';
    if (v.length < 6) return 'Minimum 6 characters';
    return null;
  }

  String? validateNew(String? v) {
    if (v == null || v.isEmpty) return 'New password is required';
    if (v.length < 6) return 'Minimum 6 characters';
    if (v == currentPasswordController.text) return 'Must differ from current password';
    return null;
  }

  Future<void> changePassword() async {
    if (isLoading.value) return;
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
      Get.snackbar('Success', 'Password changed successfully',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}