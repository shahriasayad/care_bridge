import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/features/role/user/user_track/controller/user_track_meal_controller.dart';

class UserTextTabWidget extends StatelessWidget {
  const UserTextTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserTrackMealController>();

    return Container(
      height: 252,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.scoreCardBackgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFAF2EC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0XFFEBE9E8),
                  width: 1,
                ),
              ),
              child: TextField(
                onChanged: (val) => controller.textInput.value = val,
                maxLines: null,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryTextColor,
                ),
                decoration: InputDecoration(
                  hintText:
                      'Describe your meal...e.g.,2 eggs, toast with butter,orange juice',
                  hintStyle: getTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Analyze with AI',
            onTap: () {
              // Trigger analysis or mockup action
            },
          ),
        ],
      ),
    );
  }
}
