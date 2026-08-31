import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';

class UserProviderProfileInfo extends StatelessWidget {
  final UserProviderModel provider;
  const UserProviderProfileInfo({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 18),
            const SizedBox(width: 4),
            Text(
              '${provider.rating} (${provider.reviews} reviews)',
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.providerCardBackgroundColor,
              size: 18,
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
            const SizedBox(width: 16),
            const Icon(
              Icons.check,
              color: Color(0xFF16A34A),
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              'Verified',
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
