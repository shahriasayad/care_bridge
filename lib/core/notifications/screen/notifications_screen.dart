import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/notifications/controller/notifications_controller.dart';
import 'package:care_bridge/core/notifications/widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final NotificationsController c = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const CustomAppBar(
                title: 'Notifications',
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 8),
              Expanded(child: Obx(() => _buildBody())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (c.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.circularProgressIndicatorColor,
        ),
      );
    }

    if (c.errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              c.errorMessage.value,
              style: getTextStyle(
                fontSize: 14,
                color: AppColors.secondaryTextColor,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: c.fetchNotifications,
              child: Text(
                'Retry',
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryButtonColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (c.notifications.isEmpty) {
      return Center(
        child: Text(
          'No notifications yet.',
          style: getTextStyle(
            fontSize: 14,
            color: AppColors.secondaryTextColor,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: c.notifications.length,
      itemBuilder: (context, index) {
        return NotificationTile(
          notification: c.notifications[index],
          showDivider: index < c.notifications.length - 1,
        );
      },
    );
  }
}
