import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/auth/about_you/controller/select_gender_controller.dart';

class SelectGenderScreen extends StatelessWidget {
  const SelectGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectGenderController());
    final List<String> genders = ['Female', 'Male', 'Prefer not to say'];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom Header Bar (Same style as Age screen)
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
              // Horizontal Step Progress Bar (Step 2 Onboarding)
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
                "What is your gender?",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),
              // Screen Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "This helps us personalize your health insights",
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // Gender Options Selectors
              Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: genders.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final gender = genders[index];
                    return Obx(() {
                      final isSelected =
                          controller.selectedGender.value == gender;
                      return GestureDetector(
                        onTap: () => controller.selectGender(gender),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFDF9F6),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.iconColor
                                  : AppColors.deviderColor,
                              width: isSelected ? 1.5 : 1.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Left Silhouette Icon
                              const Icon(
                                Icons.person,
                                color: AppColors.iconColor,
                                size: 24,
                              ),
                              const SizedBox(width: 16),
                              // Gender Label Text
                              Expanded(
                                child: Text(
                                  gender,
                                  style: getTextStyle(
                                    fontSize: 20,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ),
                              // Right Checkmark Icon (only visible when selected)
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: AppColors.iconColor,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
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
