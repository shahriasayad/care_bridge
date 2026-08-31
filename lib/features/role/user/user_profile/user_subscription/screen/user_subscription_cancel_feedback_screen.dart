import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/controller/user_subscription_cancel_feedback_controller.dart';

class UserSubscriptionCancelFeedbackScreen extends StatelessWidget {
  const UserSubscriptionCancelFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserSubscriptionCancelFeedbackController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAppBar(
                title: 'Any additional feedback?',
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 32),

              // Title label
              Text(
                'We’d love to hear more (optional)',
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),

              // Multi-line feedback input field
              TextField(
                controller: controller.feedbackController,
                maxLines: 6,
                maxLength: 500,
                style: getTextStyle(fontSize: 14),
                buildCounter:
                    (
                      BuildContext context, {
                      required int currentLength,
                      required int? maxLength,
                      required bool isFocused,
                    }) =>
                        null, // Hide the default counter to display our custom positioned counter
                decoration: InputDecoration(
                  hintText: 'message',
                  hintStyle: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.borderColor),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Character count (e.g. 33/500)
              Align(
                alignment: Alignment.centerRight,
                child: Obx(() {
                  return Text(
                    '${controller.characterCount.value}/500',
                    style: getTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryTextColor,
                    ),
                  );
                }),
              ),

              const Spacer(),

              // Submit Button
              CustomButton(
                text: 'Submit',
                onTap: controller.continueToConfirmation,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
