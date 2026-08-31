import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/controller/user_profile_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/widgets/profile_avatarcard_widgets.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/widgets/profile_menu_list_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());

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
                        ProfileAvatarCard(
                          user: controller.user.value,
                          onEditTap: controller.onEditAvatar,
                        ),
                        const SizedBox(height: 24),
                        ProfileMenuList(
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
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
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
