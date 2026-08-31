import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class TotalWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final String? subValue;
  const TotalWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
    this.subValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(iconPath, width: 24, height: 24),
          SizedBox(height: 16),
          Text(
            title,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          if (subValue != null) ...[
            SizedBox(height: 4),
            Text(
              subValue!,
              style: getTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

