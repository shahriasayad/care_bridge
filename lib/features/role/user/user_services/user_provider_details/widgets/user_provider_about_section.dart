import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class UserProviderAboutSection extends StatelessWidget {
  final String about;
  const UserProviderAboutSection({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
           SizedBox(height: 12),
          Text(
            about,
            style: getTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
