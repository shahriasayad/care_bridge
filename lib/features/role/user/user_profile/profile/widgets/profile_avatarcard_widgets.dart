import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/model/user_profile_model.dart';

class ProfileAvatarCard extends StatelessWidget {
  final UserProfileModel user;
  final VoidCallback onEditTap;

  const ProfileAvatarCard({
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
          Column(
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
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
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
    final ImageProvider imgProvider = (avatarUrl != null)
        ? (avatarUrl!.startsWith('http')
              ? NetworkImage(avatarUrl!)
              : AssetImage(avatarUrl!) as ImageProvider)
        : const AssetImage(IconPath.userProfileIcon2);

    return Stack(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.scoreCardBackgroundColor,
          backgroundImage: imgProvider,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onEditTap,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: AppColors.iconColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, size: 11, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
