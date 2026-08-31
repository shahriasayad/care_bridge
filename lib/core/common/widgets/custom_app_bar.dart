import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final bool showNotificationButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    required this.showBackButton,
    required this.showNotificationButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBackButton)
          GestureDetector(
            onTap: Get.back,
            child: Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFAF2EC),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.secondaryTextColor,
                  size: 20,
                ),
              ),
            ),
          ),
        const Spacer(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: getTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ],
        ),
        const Spacer(),
        if (showNotificationButton)
          GestureDetector(
            onTap: () => Get.toNamed('/notificationsScreen'),
            child: Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFAF2EC),
              ),
              child: const Center(
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.secondaryTextColor,
                  size: 22,
                ),
              ),
            ),
          )
        else if (showBackButton)
          const SizedBox(width: 48),
      ],
    );
  }
}
