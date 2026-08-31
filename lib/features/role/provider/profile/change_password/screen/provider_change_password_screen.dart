import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/profile/change_password/controller/provider_change_password_controller.dart';

class ProviderChangePasswordScreens extends StatelessWidget {
  const ProviderChangePasswordScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderChangePasswordController());
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
                     CustomTextFormField(
                          label: 'Current Password',
                          isRequired: true,
                          hintText: 'Enter your current password',
                          controller: controller.currentPasswordController,
                          suffixIcon: IconButton(
                            onPressed: controller.toggleCurrent,
                            icon: Icon(
                              controller.isCurrentObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          obscureText: controller.isCurrentObscure.value,
                          textInputAction: TextInputAction.done,
                          validator: (value) =>
                              controller.validateCurrent(value),
                        ),
                      const SizedBox(height: 24),
                     CustomTextFormField(
                          label: '  New Password',
                          isRequired: true,
                          hintText: 'Enter your new password',
                          controller: controller.newPasswordController,
                          suffixIcon: IconButton(
                            onPressed: controller.toggleNew,
                            icon: Icon(
                              controller.isNewObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          obscureText: controller.isNewObscure.value,
                          textInputAction: TextInputAction.done,
                          validator: (value) =>
                              controller.validateNew(value),
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
                //   isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
