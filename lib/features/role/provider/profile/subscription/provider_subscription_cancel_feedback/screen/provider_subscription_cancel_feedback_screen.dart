import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/provider_subscription_cancel_feedback/controller/provider_subscription_cancel_feedback_controller.dart';

class ProviderSubscriptionCancelFeedbackScreen extends StatelessWidget {
  const ProviderSubscriptionCancelFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderSubscriptionCancelFeedbackController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: "Any additional feedback?",
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 24),
              Text(
                "We’d love to hear more (optional)",
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                label: "",
                controller: controller.feedbackController,
                hintText: "message",
                maxLines: 8,
                onChanged: controller.updateCharacterCount,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Obx(
                  () => Text(
                    "${controller.characterCount.value}/${controller.maxCharacters}",
                    style: getTextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryTextColor2,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(text: "Submit", onTap: controller.submitFeedback),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
