import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/auth/about_you/controller/select_activity_controller.dart';

class SelectActivityScreen extends StatelessWidget {
  const SelectActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectActivityController());

    final List<Map<String, String>> activities = [
      {'title': 'Sedentary', 'subtitle': 'Little or no exercise'},
      {'title': 'Light Active', 'subtitle': '1-3 days per week'},
      {'title': 'Moderately Active', 'subtitle': '3-5 days per week'},
      {'title': 'Very Active', 'subtitle': '6-7 days per week'},
      {'title': 'Extremely Active', 'subtitle': 'Very intense daily activity'},
    ];

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
              // Horizontal Step Progress Bar
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
              const SizedBox(height: 36),
              // Screen Main Title
              Text(
                "How would you describe\nyour current activity level?",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),
              // Screen Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "This helps us understand your daily energy needs.",
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Options List
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: activities.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final option = activities[index];
                    final title = option['title']!;
                    final subtitle = option['subtitle']!;

                    return Obx(() {
                      final isSelected =
                          controller.selectedActivity.value == title;
                      return GestureDetector(
                        onTap: () => controller.selectActivity(title),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.iconColor
                                  : AppColors.borderColor,
                              width: isSelected ? 1.5 : 1.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Left Icon
                              const Icon(
                                Icons.directions_run_rounded,
                                color: AppColors.iconColor,
                                size: 24,
                              ),
                              const SizedBox(width: 16),
                              // Texts
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: getTextStyle(
                                        fontSize: 20,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      subtitle,
                                      style: getTextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Right Checkmark Icon
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
              const SizedBox(height: 16),
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
