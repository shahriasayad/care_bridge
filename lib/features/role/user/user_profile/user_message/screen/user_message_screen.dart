import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/user_message/controller/user_message_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/user_message/widgets/user_message_list_widgets.dart';

class UserMessageScreen extends StatelessWidget {
  const UserMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserMessageController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomAppBar(
              title: 'Message',
              showBackButton: true,
              showNotificationButton: false,
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.filtered.isEmpty) {
          return const _EmptyState();
        }
        return RefreshIndicator(
          onRefresh: controller.refresh,
          color: AppColors.primaryButtonColor,
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            itemCount: controller.filtered.length,
            separatorBuilder: (_, _) => Divider(
              height: 1,
              thickness: 0.7,
              color: AppColors.deviderColor,
              // indent: 74,
              indent: 20,
              endIndent: 20,
            ),
            itemBuilder: (_, index) {
              final msg = controller.filtered[index];
              return MessageListTile(
                message: msg,
                onTap: () => controller.onConversationTap(msg),
              );
            },
          ),
        );
      }),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.circularProgressIndicatorColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chat_bubble_outline,
                size: 42,
                color: AppColors.secondaryTextColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No conversations yet',
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start chatting with people and your messages will appear here.',
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}