import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10000),
          color: backgroundColor ?? AppColors.primaryButtonColor,
        ),
        child: Center(
          child: Text(
            text,
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor ?? AppColors.tertiaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
