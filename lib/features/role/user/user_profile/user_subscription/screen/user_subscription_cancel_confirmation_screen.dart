import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class UserSubscriptionCancelConfirmationScreen extends StatelessWidget {
  const UserSubscriptionCancelConfirmationScreen({super.key});

  Widget _buildCheckItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Icon(
              Icons.check,
              size: 16,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.close(5);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(
                  title: 'Cancel subscription',
                  showBackButton: true,
                  showNotificationButton: false,
                ),
                const SizedBox(height: 48),

                // Success checkmark illustration
                Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF16A34A),
                        width: 4,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        size: 72,
                        color: Color(0xFF16A34A),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Header text
                Text(
                  'Your subscription has been canceled',
                  style: getTextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle info text
                Text(
                  'You’ll continue to have access until May 31, 2025',
                  style: getTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 32),

                // Section title
                Text(
                  'What’s next?',
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 16),

                // Checklist bullet items
                _buildCheckItem('You’ll receive a confirmation notice'),
                _buildCheckItem('Your feedback has been recorded'),
                _buildCheckItem('You can rejoin anytime'),

                const Spacer(),

                // Done Button
                CustomButton(
                  text: 'Done',
                  onTap: () {
                    Get.close(5);
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
