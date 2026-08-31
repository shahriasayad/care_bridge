import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/cancel_subscription/controller/provider_cancel_subscription_controller.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/cancel_subscription/widgets/cancel_header.dart';

class ProviderCancelSubscriptionScreen extends StatelessWidget {
  const ProviderCancelSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderCancelSubscriptionController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const CustomAppBar(
                title: "Cancel Subscription",
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 40),
              const CancelHeader(),
              const SizedBox(height: 32),
              _buildReasonItem("It only takes 30 seconds"),
              _buildReasonItem("Helps us improving your experience"),
              _buildReasonItem("You may be eligible for an offer"),
              const Spacer(),
              CustomButton(
                text: "Continue",
                onTap: controller.proceedToFeedback,
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "No thanks, cancel anyway",
                onTap: controller.cancelAnyway,
                backgroundColor: Colors.transparent,
                textColor: AppColors.primaryButtonColor,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReasonItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          const Icon(
            Icons.access_time_rounded,
            color: AppColors.iconColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
