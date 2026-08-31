import 'dart:io';
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/profile/profile_main/model/provider_profile_model.dart';

class ProviderAvatarCard extends StatelessWidget {
  final ProviderProfileModel user;
  final VoidCallback onEditTap;

  const ProviderAvatarCard({
    super.key,
    required this.user,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _Avatar(avatarUrl: user.avatarUrl, onEditTap: onEditTap),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback onEditTap;

  const _Avatar({required this.avatarUrl, required this.onEditTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: AppColors.scoreCardBackgroundColor,
          backgroundImage: (avatarUrl != null && avatarUrl!.isNotEmpty)
              ? FileImage(File(avatarUrl!)) as ImageProvider
              : const AssetImage(IconPath.userProfileIcon2),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onEditTap,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.iconColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, size: 10, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
