import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/auth/about_you/controller/about_you_controller.dart';

class AboutYouScreen extends StatelessWidget {
  const AboutYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutYouController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.iconBackground,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: AppColors.primaryTextColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Text(
                    "About You",
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 40), // Spacing placeholder for symmetry
                ],
              ),
              const SizedBox(height: 20),
              // Horizontal Step Progress Bar (Onboarding Step 1)
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const LinearProgressIndicator(
                  value: 0.5,
                  minHeight: 4,
                  backgroundColor: AppColors.borderColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.iconColor,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // Screen Main Title
              Text(
                "What is your age?",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),
              // Screen Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "This helps us tailor recommendations for your body and lifestyle",
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              const Spacer(),
              // Age Incremental Picker Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Minus Button
                  GestureDetector(
                    onTap: controller.decrementAge,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.08),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.primaryTextColor,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Centered Age Display Box
                  Obx(
                    () => Container(
                      width: 140,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDF9F6),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.secondaryTextColor,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.age.value}",
                            style: getTextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "years old",
                            style: getTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Plus Button
                  GestureDetector(
                    onTap: controller.incrementAge,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primaryButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Bottom Continue Button
              CustomButton(text: "Continue", onTap: controller.continueToNext),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
