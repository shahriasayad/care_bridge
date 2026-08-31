import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/features/role/user/user_track/controller/user_track_meal_controller.dart';
import 'package:care_bridge/features/role/user/user_track/widgets/user_ai_detection_preview_widget.dart';
import 'package:care_bridge/features/role/user/user_track/widgets/user_camera_tab_widget.dart';
import 'package:care_bridge/features/role/user/user_track/widgets/user_text_tab_widget.dart';
import 'package:care_bridge/features/role/user/user_track/widgets/user_track_meal_tabs.dart';
import 'package:care_bridge/features/role/user/user_track/widgets/user_voice_tab_widget.dart';

class UserTrackMealScreen extends StatelessWidget {
  UserTrackMealScreen({super.key});

  final UserTrackMealController controller = Get.put(UserTrackMealController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 68,
            left: 16,
            right: 16,
            bottom: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Track Meal',
                subtitle: 'Log your meal and get AI-powered insights',
                showBackButton: true,
                showNotificationButton: true,
              ),
              const SizedBox(height: 24),

              UserTrackMealTabs(controller: controller),
              const SizedBox(height: 20),

              Obx(() {
                switch (controller.selectedTab.value) {
                  case 0:
                    return UserCameraTabWidget();
                  case 1:
                    return UserVoiceTabWidget();
                  case 2:
                    return UserTextTabWidget();
                  default:
                    return UserCameraTabWidget();
                }
              }),
              const SizedBox(height: 20),

              const UserAiDetectionPreviewWidget(),
              const SizedBox(height: 24),

              CustomButton(
                text: 'Confirm Meal',
                onTap: () => controller.confirmMeal(),
              ),
              const SizedBox(height: 12),
              Obx(() {
                final selectedTab = controller.selectedTab.value;
                String buttonText;
                VoidCallback onTap;

                if (selectedTab == 0) {
                  buttonText = 'Retake Photo';
                  onTap = () => controller.pickedImage.value = null;
                } else if (selectedTab == 1) {
                  buttonText = 'Voice Again';
                  onTap = () {
                    // Action for Voice Again
                  };
                } else {
                  buttonText = 'Analyze again';
                  onTap = () {
                    // Action for Analyze again
                  };
                }

                return CustomButton(
                  text: buttonText,
                  backgroundColor: const Color(0xFFEDE8E4),
                  textColor: AppColors.secondaryTextColor,
                  onTap: onTap,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
