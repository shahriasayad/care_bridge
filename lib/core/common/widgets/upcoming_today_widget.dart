import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UpcomingTodayWidget extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String service;
  final String time;
  final String date;
  final String status;
  final String amount;
  const UpcomingTodayWidget({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.service,
    required this.time,
    required this.date,
    required this.status,
    required this.amount,
  });

  Color getStatusColor() {
    switch (status.toLowerCase()) {
      case 'upcoming':
        return AppColors.upcomingColor;

      case 'completed':
        return AppColors.completedColor;

      case 'canceled':
        return AppColors.cancelledColor;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.clientDetailsScreen);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(avatarUrl), radius: 22),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  service,
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppColors.iconColor,
                    ),
                    SizedBox(width: 4),
                    Text(
                      time,
                      style: getTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: AppColors.iconColor,
                    ),
                    SizedBox(width: 4),
                    Text(
                      date,
                      style: getTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: getStatusColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '\$$amount',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryButtonColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
