import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/controller/user_booking_controller.dart';

class UserBookingProgressBar extends StatelessWidget {
  final UserBookingController controller;
  const UserBookingProgressBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            '${controller.currentStep.value} of 3',
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
           SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: controller.currentStep.value / 3,
              backgroundColor: Colors.grey.shade200,
              valueColor:  AlwaysStoppedAnimation<Color>(
                AppColors.providerCardBackgroundColor,
              ),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
