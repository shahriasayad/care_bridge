import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/common/widgets/divider_widget.dart';
import 'package:care_bridge/core/common/widgets/social_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/auth/create_account/controller/create_account_controller.dart';
import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';
import 'package:care_bridge/routes/app_routes.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final CreateAccountController controller = Get.put(CreateAccountController());
  final RoleController roleController = Get.find<RoleController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.only(top: 75, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImagePath.appLogo, width: 120, height: 72),
                SizedBox(height: 56),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create Your Account',
                    style: getTextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Fill out the form',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ),

                SizedBox(height: 48),
                CustomTextFormField(
                  label: 'Full Name',
                  hintText: 'Enter your full name',
                  isRequired: true,
                  controller: controller.fullNameController,
                  validator: (value) => controller.validateFullName(value),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  isRequired: true,
                  controller: controller.emailController,
                  validator: (value) => controller.validateEmail(value),
                ),
                SizedBox(height: 24),
                Obx(
                  () => CustomTextFormField(
                    label: 'Password',
                    isRequired: true,
                    hintText: 'Enter your password',
                    controller: controller.passwordController,
                    suffixIcon: IconButton(
                      onPressed: controller.togglePasswordVisibility,
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    obscureText: controller.isPasswordHidden.value,
                    textInputAction: TextInputAction.done,
                    validator: (value) => controller.validatePassword(value),
                  ),
                ),
                SizedBox(height: 32),
                Obx(
                  () => CustomButton(
                    text: roleController.selectedRole.value == 'User'
                        ? 'Create Account'
                        : 'Continue',
                    onTap: controller.isLoading.value
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              controller.createAccount();
                            }
                          },
                  ),
                ),
                SizedBox(height: 32),
                DividerWidget(),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SocialButton(
                      imagePath: IconPath.google,
                      onTap: controller.signInWithGoogle,
                    ),
                    SizedBox(width: 16),
                    SocialButton(
                      imagePath: IconPath.apple,
                      backgroundColor: Colors.black,
                      onTap: controller.signInWithApple,
                    ),
                  ],
                ),
                SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                    text: 'Do you have an account? ',
                    style: getTextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.loginScreen);
                          },
                        text: 'Sign In',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryButtonColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
