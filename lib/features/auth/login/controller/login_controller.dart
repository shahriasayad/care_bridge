import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:care_bridge/features/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:care_bridge/features/bottom_nav/screen/bottom_nav_screen.dart';
import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RoleController roleController = Get.find<RoleController>();

  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  String? validateEmail(String? value) {
    // if (value == null || value.trim().isEmpty) {
    //   return 'Email is required';
    // }
    // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
    //   return 'Please enter a valid email';
    // }
    return null;
  }

  String? validatePassword(String? value) {
    // if (value == null || value.trim().isEmpty) {
    //   return 'Password is required';
    // }
    // if (value.trim().length < 6) {
    //   return 'Password must be at least 6 characters';
    // }
    return null;
  }

  Future<void> login() {
    try {
      isLoading.value = true;

      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      EasyLoading.show(status: 'Signing in...');

      Future.delayed(const Duration(seconds: 1), () {
        bool isSuccess = email == email && password == password;

        EasyLoading.dismiss();

        if (isSuccess) {
          EasyLoading.showSuccess('Login Successful');

          final selectedRole = roleController.selectedRole.value;

          if (selectedRole == 'User') {
            Get.off(() => BottomNavScreen(), binding: BottomNavBinding());
          } else if (selectedRole == 'Provider') {
            Get.off(() => BottomNavScreen(), binding: BottomNavBinding());
          } else {
            EasyLoading.showError(
              'Please select a role first',
              duration: const Duration(seconds: 2),
            );
          }
        } else {
          EasyLoading.showError('Invalid email or password');
        }

        isLoading.value = false;
      });
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Login failed: ${e.toString()}');
      isLoading.value = false;
    }
    return Future.value();
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      EasyLoading.showSuccess(
        'Google Sign-In Clicked',
        duration: Duration(seconds: 1),
      );
    } catch (e) {
      EasyLoading.showError(
        'Google Sign-In Error: ${e.toString()}',
        duration: Duration(seconds: 1),
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
        duration: Duration(seconds: 1),
      );
    } catch (e) {
      EasyLoading.showError(
        'Apple Sign-In Error: ${e.toString()}',
        duration: Duration(seconds: 1),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
