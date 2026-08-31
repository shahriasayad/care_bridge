import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';

class UserSuccessProviderInfo extends StatelessWidget {
  final UserProviderModel provider;
  const UserSuccessProviderInfo({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: provider.image.startsWith('http')
              ? NetworkImage(provider.image)
              : AssetImage(provider.image) as ImageProvider,
        ),
        const SizedBox(height: 12),
        Text(
          provider.name,
          style: getTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          provider.specialty,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 16),
            const SizedBox(width: 4),
            Text(
              '${provider.rating} (${provider.reviews} reviews)',
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
            const SizedBox(width: 12),
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.providerCardBackgroundColor,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '1.2 km',
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
