import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/controller/provider_subscription_controller.dart';
import 'package:care_bridge/features/role/provider/profile/subscription/widgets/provider_subscription_feature_card.dart';

class ProviderSubscriptionScreen extends StatelessWidget {
  const ProviderSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderSubscriptionController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CustomAppBar(
                title: "Subscription",
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 40),
              Center(child: const ProviderSubscriptionFeatureCard()),
              const Spacer(),
              CustomButton(
                text: "Cancel",
                onTap: controller.cancelSubscription,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
