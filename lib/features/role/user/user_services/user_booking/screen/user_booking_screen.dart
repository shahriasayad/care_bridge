import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/controller/user_booking_controller.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_booking_progress_bar.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_payment_bottom_sheet.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_review_confirm_view.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_select_date_time_view.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_select_service_view.dart';

class UserBookingScreen extends StatelessWidget {
  const UserBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserBookingController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.grey),
          ),
          onPressed: () {
            if (controller.currentStep.value > 1) {
              controller.previousStep();
            } else {
              Get.back();
            }
          },
        ),
        title: Text(
          'Book with Devon James',
          style: getTextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Column(
          children: [
            SizedBox(height: 10),
            UserBookingProgressBar(controller: controller),
            SizedBox(height: 30),
            Expanded(child: _buildStepContent(controller)),
            _buildBottomButton(controller),
          ],
        );
      }),
    );
  }

  Widget _buildStepContent(UserBookingController controller) {
    switch (controller.currentStep.value) {
      case 1:
        return UserSelectServiceView(controller: controller);
      case 2:
        return UserSelectDateTimeView(controller: controller);
      case 3:
        return UserReviewConfirmView(controller: controller);
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildBottomButton(UserBookingController controller) {
    if (controller.currentStep.value == 3) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Back',
                backgroundColor: AppColors.iconBackground,
                textColor: AppColors.secondaryTextColor,
                onTap: controller.previousStep,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                text: 'Confirm Booking',
                onTap: () =>
                    UserPaymentBottomSheet.show(Get.context!, controller),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(20),
      child: CustomButton(text: 'Next', onTap: controller.nextStep),
    );
  }
}
