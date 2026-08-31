import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/features/role/user/user_track/controller/user_track_meal_controller.dart';

class UserVoiceTabWidget extends StatelessWidget {
  const UserVoiceTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserTrackMealController>();

    return Container(
      height: 252,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.iconBackground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                IconPath.voiceIcon,
                color: AppColors.iconColor,
                width: 26,
                height: 26,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Tap and describe what you ate',
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '"I had a grilled chicken sandwich with a side salad"',
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Obx(
            () => CustomButton(
              text: controller.isRecording.value
                  ? 'Stop Recording'
                  : 'Start Recording',
              onTap: controller.toggleRecording,
            ),
          ),
        ],
      ),
    );
  }
}
