import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:care_bridge/features/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:care_bridge/features/bottom_nav/screen/bottom_nav_screen.dart';
import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';
import 'package:care_bridge/routes/app_routes.dart';

class CreateAccountController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RoleController roleController = Get.find<RoleController>();

  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }

    if (value.trim().length < 3) {
      return 'Full name must be at least 3 characters';
    }

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
      return 'Full name can only contain letters';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.trim().length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> createAccount() async {
    try {
      isLoading.value = true;

      final selectedRole = roleController.selectedRole.value;

      if (selectedRole == 'User') {
        Get.offNamed(AppRoutes.createSplashScreen);
      } else if (selectedRole == 'Provider') {
        Get.toNamed('/chooseYourSpecialisationScreen');
      } else {
        EasyLoading.showError(
          'Please select a role first',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      EasyLoading.showError(e.toString(), duration: const Duration(seconds: 2));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      EasyLoading.showSuccess(
        'Google Sign-In Clicked',
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      EasyLoading.showError(
        'Google Sign-In Error: ${e.toString()}',
        duration: Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;
      EasyLoading.showSuccess(
        'Apple Sign-In Clicked',
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      EasyLoading.showError(
        'Apple Sign-In Error: ${e.toString()}',
        duration: Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
