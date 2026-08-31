import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class UserMacroItemWidget extends StatelessWidget {
  final String iconPath;
  final String value;
  final String label;

  const UserMacroItemWidget({
    super.key,
    required this.iconPath,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        margin:  EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.iconBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.asset(iconPath, width: 15, height: 20),
             SizedBox(height: 12),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
             const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
