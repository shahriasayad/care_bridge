import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class FollowUpItem extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final bool isUrgent;

  const FollowUpItem({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    this.isUrgent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: getTextStyle(
                  fontSize: 12,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isUrgent ? Colors.red.withValues(alpha: 0.1) : AppColors.completedColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: getTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isUrgent ? Colors.red : AppColors.completedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
