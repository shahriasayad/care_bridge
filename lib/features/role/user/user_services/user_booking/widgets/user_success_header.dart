import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';

class UserSuccessHeader extends StatelessWidget {
  const UserSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(ImagePath.appLogo, height: 96),
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: AppColors.completedColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 24),
          Text(
            'Appointment Confirmed',
            style: getTextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
