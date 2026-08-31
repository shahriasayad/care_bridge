import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/provider_subscription_cancel_success/controller/provider_subscription_cancel_success_controller.dart';

class ProviderSubscriptionCancelSuccessScreen extends StatelessWidget {
  const ProviderSubscriptionCancelSuccessScreen({super.key});

  final List<String> _nextSteps = const [
    "You'll receive a confirmation notice",
    "Your feedback has been recorded",
    "You can rejoin anytime",
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderSubscriptionCancelSuccessController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CustomAppBar(
                title: "Cancel subscription",
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 64),
              Image.asset(IconPath.success, width: 120, height: 120),
              const SizedBox(height: 32),
              Text(
                "Your subscription has been canceled",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "You’ll continue to have access until May 31, 2025",
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What's next?",
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ..._nextSteps.map(
                (step) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: AppColors.secondaryTextColor2,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        step,
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(text: "Done", onTap: controller.onDone),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
