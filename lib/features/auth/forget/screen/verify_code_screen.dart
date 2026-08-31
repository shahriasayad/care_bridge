import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/auth/forget/controller/forget_password_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String? email;
  final String? purpose;

  const VerifyCodeScreen({super.key, this.email, this.purpose = 'register'});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    controller.setEmailAndPurpose(email, purpose);
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: getTextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryButtonColor,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryButtonColor, width: 1),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.grey, width: 2),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryButtonColor, width: 1),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 94, left: 16, right: 16),
        child: Column(
          children: [
            Image.asset(ImagePath.appLogo, width: 100, height: 76),
            SizedBox(height: 54),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter The Code',
                style: getTextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Check your e-mail and enter the code bellow.',
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            Pinput(
              length: 6,
              controller: controller.otpController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              showCursor: true,
              onCompleted: (pin) {
                debugPrint('OTP completed: $pin');
              },
              onChanged: (value) {
                debugPrint('OTP changed: $value');
              },
            ),
            const SizedBox(height: 32),
            Obx(
              () => CustomButton(
                text: 'Confirm Code',
                onTap: controller.isLoading.value
                    ? null
                    : controller.verifyCode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
