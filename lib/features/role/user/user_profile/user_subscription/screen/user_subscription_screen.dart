import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/controller/user_subscription_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/model/user_subscription_model.dart';

import 'package:care_bridge/routes/app_routes.dart';

class UserSubscriptionScreen extends StatelessWidget {
  const UserSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserSubscriptionController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAppBar(
                title: 'Subscription',
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'Buy Premium',
                  style: getTextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _PlanCard(plan: controller.plan),
              const Spacer(),
              CustomButton(
                text: 'Cancel',
                onTap: () => Get.toNamed(AppRoutes.getUserSubscriptionCancelScreen()),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final UserSubscriptionModel plan;
  const _PlanCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${plan.title} (${plan.price})',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.iconColor,
            ),
          ),
          const SizedBox(height: 24),
          ...plan.features.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                '- $f',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
