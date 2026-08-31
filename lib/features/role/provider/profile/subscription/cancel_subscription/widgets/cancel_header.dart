import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';

class CancelHeader extends StatelessWidget {
  const CancelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.borderColor,
            ),
            child: Image.asset(IconPath.sadEmoji, width: 104, height: 104),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "We’re sorry to see you go",
          style: getTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Before you cancel, please let us know why you’re leaving. Your feedback helps us improve.",
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
            textAlign: TextAlign.start,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
