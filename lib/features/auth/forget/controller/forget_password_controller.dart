import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:care_bridge/features/auth/forget/screen/forget_password_screen.dart';
import 'package:care_bridge/features/auth/forget/screen/success_screen.dart';
import 'package:care_bridge/features/auth/forget/screen/verify_code_screen.dart';
import 'package:care_bridge/features/auth/login/screen/login_screen.dart';

class ForgetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isNewPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final isLoading = false.obs;

  void toggleNewPasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  final TextEditingController otpController = TextEditingController();

  void setEmailAndPurpose(String? email, String? purpose) {}

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> sendCode() async {
    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 1));
      Get.to(VerifyCodeScreen());
      EasyLoading.showSuccess('Code sent successfully');
    } catch (e) {
      EasyLoading.showError('${'Failed to send code'}: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  String get otpCode => otpController.text;

  Future<void> verifyCode() async {
    final otp = otpController.text.trim();

    if (otp.isEmpty || otp.length < 6) {
      EasyLoading.showError('Please enter a valid 6-digit code');
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 1));

      EasyLoading.showSuccess('Code verified successfully');

      Get.to(() => ForgetPasswordScreen());
    } catch (e) {
      EasyLoading.showError('Invalid code');
    } finally {
      isLoading.value = false;
    }
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'New password is required';
    }
    if (value.trim().length < 6) {
      return 'New password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirm password is required';
    }
    if (value.trim() != newPasswordController.text.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> savePassword() async {
    if (!formKey.currentState!.validate()) return;

    try {
      await Future.delayed(const Duration(seconds: 1));
      Get.to(
        SuccessScreen(
          message: 'Your password has been changed successfully',
          buttonText: 'Continue',
          onTap: () {
            Get.off(LoginScreen());
          },
        ),
      );
      EasyLoading.showSuccess('Update password successfully');
    } catch (e) {
      EasyLoading.showError('${'Update password failed'}: ${e.toString()}');
    } finally {}
  }
}
