import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/model/user_profile_model.dart';
import 'package:care_bridge/routes/app_routes.dart';

class ProfileMenuList extends StatelessWidget {
  final List<ProfileMenuItem> items;
  final void Function(ProfileMenuItem) onTap;

  const ProfileMenuList({super.key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          thickness: 0.8,
          color: AppColors.borderColor,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) =>
            _MenuItem(item: items[index], onTap: onTap),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final ProfileMenuItem item;
  final void Function(ProfileMenuItem) onTap;

  const _MenuItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.title == 'Profile Information') {
          Get.toNamed(AppRoutes.getUserProfileInformationScreen());
        } else if (item.title == 'Message') {
          Get.toNamed(AppRoutes.getUserMessageScreen());
        } else if (item.title == 'Change Password') {
          Get.toNamed(AppRoutes.getUserChangePasswordScreen());
        } else if (item.title == 'Payment Methods') {
          Get.toNamed(AppRoutes.getUserPaymentScreen());
        } else if (item.title == 'Subscription') {
          Get.toNamed(AppRoutes.getUserSubscriptionScreen());
        } else if (item.title == 'My Appointments') {
          Get.toNamed(AppRoutes.getUserAppointmentsScreen());
        } else if (item.title == 'Help & Support') {
          Get.toNamed(AppRoutes.getUserHelpSupportScreen());
        } else if (item.title == 'My Tickets') {
          Get.toNamed(AppRoutes.getMyTicketsListScreen());
        } else {
          onTap(item);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.title,
              style: getTextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryTextColor,
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 16,
              color: AppColors.secondaryTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
