import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProviderChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  final RxBool isCurrentObscure = true.obs;
  final RxBool isNewObscure = true.obs;
  final RxBool isLoading = false.obs;
  final RxBool isPasswordHidden = false.obs;

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
    if (v == currentPasswordController.text)
      return 'Must differ from current password';
    return null;
  }

  Future<void> changePassword() async {
    if (isLoading.value) return;
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    try {
      EasyLoading.show(status: 'Changing password...');
      await Future.delayed(const Duration(seconds: 1));
      EasyLoading.dismiss();
      Get.back();
      EasyLoading.showToast('Password changed successfully');
    } finally {
      isLoading.value = false;
    }
  }

  // void togglePasswordVisibility() {
  //   isPasswordHidden.value = !isPasswordHidden.value;
  // }

  // String? validateEmail(String? value) {
  //   // if (value == null || value.trim().isEmpty) {
  //   //   return 'Email is required';
  //   // }
  //   // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
  //   //   return 'Please enter a valid email';
  //   // }
  //   return null;
  // }

  // String? validatePassword(String? value) {
  //   // if (value == null || value.trim().isEmpty) {
  //   //   return 'Password is required';
  //   // }
  //   // if (value.trim().length < 6) {
  //   //   return 'Password must be at least 6 characters';
  //   // }
  //   return null;
  // }
}
