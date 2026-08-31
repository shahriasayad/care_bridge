import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserSubscriptionCancelScreen extends StatelessWidget {
  const UserSubscriptionCancelScreen({super.key});

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Icon(
              Icons.access_time_outlined,
              size: 16,
              color: AppColors.iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: getTextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAppBar(
                title: 'Cancel Subscription',
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 48),

              // Sad Face Illustration
              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF3EFE9),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.sentiment_dissatisfied_outlined,
                      size: 80,
                      color: AppColors.iconColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Header text
              Text(
                'We’re sorry to see you go',
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),

              // Subtext
              Text(
                'Before you cancel, please let us know why you’re leaving . Your feedback helps us improve.',
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 32),

              // Bullet points
              _buildBulletPoint('It only takes 30 seconds'),
              _buildBulletPoint('Helps us improving your exprience'),
              _buildBulletPoint('You may be eligible for an offer'),

              const Spacer(),

              // Bottom buttons
              CustomButton(
                text: 'Continue',
                onTap: () {
                  Get.back();
                  Get.snackbar(
                    'Feedback',
                    'Thank you for letting us know!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.getUserSubscriptionCancelReasonsScreen());
                  },
                  child: Text(
                    'No thanks, cancel anyway',
                    style: getTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.iconColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
