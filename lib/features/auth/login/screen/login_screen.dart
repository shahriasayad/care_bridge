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
import 'package:care_bridge/features/auth/login/controller/login_controller.dart';
import 'package:care_bridge/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.only(top: 107, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImagePath.appLogo, width: 100, height: 76),
                SizedBox(height: 56),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome Back',
                    style: getTextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
                SizedBox(height: 08),
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
                  label: 'Email',
                  hintText: 'Enter your email',
                  isRequired: true,
                  controller: controller.emailController,
                  validator: (value) => controller.validateEmail(value),
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/forgetPasswordEmailScreen');
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?'.tr,
                      style: getTextStyle(
                        fontSize: 12,
                        color: AppColors.primaryButtonColor,
                        fontWeight: FontWeight.w700,
                        isUnderline: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Obx(
                  () => CustomButton(
                    text: 'Sign In',
                    onTap: controller.isLoading.value
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              controller.login();
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
                    text: '${'Don\'t have an account?'.tr} ',
                    style: getTextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.createAccountScreen);
                          },
                        text: 'Create Account',
                        style: getTextStyle(
                          fontSize: 14,
                          color: AppColors.primaryButtonColor,
                          fontWeight: FontWeight.w600,
                          isUnderline: true,
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
