import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/provider_subscription_cancel_reason/controllers/provider_subscription_cancel_reason_controller.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/provider_subscription_cancel_reason/widgets/subscription_cancel_reason_option.dart';

class ProviderSubscriptionCancelReasonScreen extends StatelessWidget {
  const ProviderSubscriptionCancelReasonScreen({super.key});

  final List<String> reasons = const [
    "Too expensive",
    "Not using it enough",
    "Didn't get enough value",
    "Found another app or service",
    "Provider issue",
    "AI coach was not helpful",
    "Technical issues",
    "Billing issue",
    "Taking a break",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderSubscriptionCancelReasonController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: "Why are you cancelling?",
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 24),
              Text(
                "Please select the reason that best fits your decision.",
                style: getTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: reasons.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => SubscriptionCancelReasonOption(
                        reason: reasons[index],
                        isSelected:
                            controller.selectedReason.value == reasons[index],
                        onTap: () => controller.selectReason(reasons[index]),
                      ),
                    );
                  },
                ),
              ),
              CustomButton(text: "Continue", onTap: controller.submitFeedback),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
