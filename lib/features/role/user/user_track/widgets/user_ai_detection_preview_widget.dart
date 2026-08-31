import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_track/controller/user_track_meal_controller.dart';
import 'package:care_bridge/features/role/user/user_track/widgets/user_macro_item_widget.dart';

class UserAiDetectionPreviewWidget extends StatelessWidget {
  const UserAiDetectionPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserTrackMealController>();
    final meal = controller.detectedMeal;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome_outlined,
                color: AppColors.primaryTextColor,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                'AI Detection Preview',
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final showImage = controller.selectedTab.value == 0;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showImage) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/demoimage.png',
                      width: 76,
                      height: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal['name'] as String,
                        style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primaryTextColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        meal['serving'] as String,
                        style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondaryTextColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  meal['calories'] as String,
                  style: getTextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.primaryButtonColor),
                ),
              ],
            );
          }),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserMacroItemWidget(
                iconPath: IconPath.caloriesIcon,
                value: meal['totalCalories'] as String,
                label: 'Calories',
              ),
              UserMacroItemWidget(
                iconPath: IconPath.carbsIcon,
                value: meal['carbs'] as String,
                label: 'Carbs',
              ),
              UserMacroItemWidget(
                iconPath: IconPath.proteinIcon,
                value: meal['protein'] as String,
                label: 'Protein',
              ),
              UserMacroItemWidget(
                iconPath: IconPath.fatIcon,
                value: meal['fat'] as String,
                label: 'Fat',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Nutrition Quality',
            style: getTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'This meal is high in protein and contains good fats and fiber',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 60,
                height: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: 0.8,
                        strokeWidth: 5,
                        backgroundColor: Color(0xFFE2EFE0),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF556643),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '80%',
                          style: getTextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        Text(
                          'Great',
                          style: getTextStyle(
                            fontSize: 5.25,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
