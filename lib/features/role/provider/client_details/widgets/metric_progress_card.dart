import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class MetricProgressCard extends StatelessWidget {
  final String title;
  final String value;
  final String goalText;
  final double? percent;
  final String? assetPath;
  final IconData? icon;

  const MetricProgressCard({
    super.key,
    required this.title,
    required this.value,
    required this.goalText,
    this.percent,
    this.assetPath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (assetPath != null && assetPath!.isNotEmpty)
            Image.asset(
              assetPath!,
              width: 24,
              height: 24,
              color: AppColors.iconColor,
            )
          else if (icon != null)
            Icon(icon, size: 24, color: AppColors.iconColor),

          const SizedBox(height: 8),
          Text(
            title,
            style: getTextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            goalText,
            style: getTextStyle(
              fontSize: 12,
              color: AppColors.secondaryTextColor,
            ),
          ),
          // const Spacer(),
          if (percent != null) ...[
            const SizedBox(height: 8),
            SizedBox(
              height: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percent!.clamp(0.0, 1.0),
                  backgroundColor: AppColors.secondaryGraphColor,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primaryGraphColor,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
