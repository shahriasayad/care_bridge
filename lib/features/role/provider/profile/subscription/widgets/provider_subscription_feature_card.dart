import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class ProviderSubscriptionFeatureCard extends StatelessWidget {
  const ProviderSubscriptionFeatureCard({super.key});

  final List<String> _features = const [
    "Everything in free, plus:",
    "5–10 AI recommendations/day",
    "Full weekly & monthly data reports",
    "Access to all health providers",
    "Full calorie surplus/deficit analysis",
    "Progress tracking with charts (daily / weekly / monthly)",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Buy Premium",
          style: getTextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Premium Dashboard (\$8.99/month)",
                style: getTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryButtonColor,
                ),
              ),
              const SizedBox(height: 16),
              ..._features.map(
                (f) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    "- $f",
                    style: getTextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryTextColor,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
