import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/user/user_profile/user_password/controller/user_change_password_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/user_password/widgets/password_field_widgets.dart';

class UserChangePasswordScreen extends StatelessWidget {
  const UserChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserChangePasswordController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomAppBar(
              title: 'Change Password',
              showBackButton: true,
              showNotificationButton: false,
            ),
          ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PasswordField(
                        label: 'Current Password',
                        controller: controller.currentPasswordController,
                        obscureText: controller.isCurrentObscure.value,
                        onToggle: controller.toggleCurrent,
                        validator: controller.validateCurrent,
                      ),
                      const SizedBox(height: 24),
                      PasswordField(
                        label: 'New Password',
                        controller: controller.newPasswordController,
                        obscureText: controller.isNewObscure.value,
                        onToggle: controller.toggleNew,
                        validator: controller.validateNew,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              child: CustomButton(
                text: 'Change Password',
                onTap: controller.changePassword,
              ),
            ),
          ],
        ),
      ),
    );
  }
}