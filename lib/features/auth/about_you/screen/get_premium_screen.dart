import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/auth/about_you/controller/get_premium_controller.dart';

class GetPremiumScreen extends StatelessWidget {
  const GetPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetPremiumController());

    final List<Map<String, String>> benefits = [
      {
        'title': 'Unlimited AI Coaching & Insights',
        'subtitle': 'Get personalized guidance anytime.',
      },
      {
        'title': 'AI That Learns You',
        'subtitle': 'Identifies patterns in your habits and health.',
      },
      {
        'title': 'Smart Calorie & Macro Analysis',
        'subtitle': 'Understand exactly what drives your results.',
      },
      {
        'title': 'Advanced Progress Tracking',
        'subtitle': 'Monitor weight, nutrition, fitness, and wellness trends.',
      },
      {
        'title': 'Weekly Health Reports',
        'subtitle': 'See what\'s working and what to do next.',
      },
      {
        'title': 'Access to Health Professionals',
        'subtitle': 'Connect with dietitians, coaches, and wellness experts.',
      },
      {
        'title': 'Goal Tracking & Accountability',
        'subtitle': 'Build habits, maintain streaks, and stay motivated.',
      },
      {
        'title': 'Private & Secure Health Data',
        'subtitle': 'Your information is always protected.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section back chevron
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.iconBackground,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    color: AppColors.primaryTextColor,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Main Screen Header
              Center(
                child: Text(
                  "Get the full experience",
                  style: getTextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Scrollable Benefits List
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Premium Dashboard Header Benefit
                      _buildFeatureItem(
                        "Premium Dashboard (\$8.99/month)",
                        "",
                        Icons.workspace_premium_rounded,
                        isPremiumHeader: true,
                      ),
                      const SizedBox(height: 12),
                      // List of other features
                      ...benefits.map((benefit) {
                        return _buildFeatureItem(
                          benefit['title']!,
                          benefit['subtitle']!,
                          Icons.check_rounded,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Bottom Action Buttons
              CustomButton(text: "Purchase", onTap: controller.purchase),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: controller.skip,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.iconBackground,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Skip for Now",
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.iconColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    String title,
    String subtitle,
    IconData icon, {
    bool isPremiumHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.iconColor,
            size: isPremiumHeader ? 26 : 20,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: isPremiumHeader
                        ? AppColors.iconColor
                        : AppColors.primaryTextColor,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: getTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
