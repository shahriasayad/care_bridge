import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/message/message_list/controller/provider_message_controller.dart';
import 'package:care_bridge/features/role/provider/message/message_list/widgets/message_empty_state.dart' show EmptyState;
import 'package:care_bridge/features/role/provider/message/message_list/widgets/provider_message_tile.dart';

class ProviderMessageScreen extends StatelessWidget {
  const ProviderMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderMessageController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomAppBar(
                  title: 'Message',
                  showBackButton: false,
                  showNotificationButton: false,
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.conversations.isEmpty) {
                    return const EmptyState();
                  }
                  return RefreshIndicator(
                    onRefresh: controller.refreshConversations,
                    color: AppColors.primaryButtonColor,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 12, bottom: 20),
                      itemCount: controller.conversations.length,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          height: 1,
                          thickness: 0.7,
                          color: AppColors.deviderColor,
                        ),
                      ),
                      itemBuilder: (_, index) {
                        final msg = controller.conversations[index];
                        return ProviderMessageTile(
                          message: msg,
                          onTap: () => controller.onConversationTap(msg),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

