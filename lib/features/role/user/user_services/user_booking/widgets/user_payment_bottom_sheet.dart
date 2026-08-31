import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/controller/user_booking_controller.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserPaymentBottomSheet extends StatelessWidget {
  final UserBookingController controller;
  const UserPaymentBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Select Payment Method',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Row(
              children: [
                Image.asset(
                  IconPath.stripeLogo,
                  width: 57.4,
                  height: 23.8,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Text(
                    'stripe',
                    style: getTextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Select Payment Method',
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: 'Continue',
            onTap: () {
              Get.back();
              Get.toNamed(
                AppRoutes.userBookingSuccessScreen,
                arguments: {
                  'provider': controller.provider,
                  'service': controller.selectedService,
                  'date': controller.formattedDate,
                  'time': controller.selectedTime.value,
                  'platformFee': controller.platformFee,
                  'total': controller.totalAmount,
                },
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static void show(BuildContext context, UserBookingController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => UserPaymentBottomSheet(controller: controller),
    );
  }
}
