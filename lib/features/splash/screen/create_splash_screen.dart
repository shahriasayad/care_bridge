import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/splash/controller/create_splash_screen_controller.dart';

class CreateSplashScreen extends StatelessWidget {
  const CreateSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateSplashScreenController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              const Spacer(),
              // Logo in the upper center
              Image.asset(ImagePath.appLogo, width: 180, height: 137),
              const SizedBox(height: 48),
              // Personalization Title
              Text(
                "Let’s personalize your\nexperience",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 16),
              // Subtitle instruction
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Answer a few questions so Grovr can understand your current status and help you reach your goals faster.",
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              const Spacer(),
              // "Let's Get Started" Button
              CustomButton(
                text: "Let’s Get Started",
                onTap: () => controller.navigateToNext(),
              ),
              const SizedBox(height: 12),
              // Subtext below the button
              Text(
                "Takes about 2-3 minutes",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
