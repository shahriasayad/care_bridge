import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/profile/profile_main/controller/provider_profile_controller.dart';
import 'package:care_bridge/features/role/provider/profile/profile_main/widgets/provider_avatar_card.dart';
import 'package:care_bridge/features/role/provider/profile/profile_main/widgets/provider_menu_list.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderProfileController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CustomAppBar(
                title: 'Profile',
                showBackButton: true,
                showNotificationButton: true,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      children: [
                        ProviderAvatarCard(
                          user: controller.user.value,
                          onEditTap: controller.onEditAvatar,
                        ),
                        const SizedBox(height: 24),
                        ProviderMenuList(
                          items: controller.menuItems,
                          onTap: controller.onMenuTap,
                        ),
                        const SizedBox(height: 24),
                        _DeleteAccountButton(onTap: controller.onDeleteAccount),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeleteAccountButton extends StatelessWidget {
  final VoidCallback onTap;
  const _DeleteAccountButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.deleteBackground,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Delete Account',
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.cancelledColor,
          ),
        ),
      ),
    );
  }
}
