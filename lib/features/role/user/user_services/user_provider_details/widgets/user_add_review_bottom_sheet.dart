import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/controller/user_provider_details_controller.dart';

class UserAddReviewBottomSheet extends StatelessWidget {
  final UserProviderDetailsController controller;
  const UserAddReviewBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'What is your rate?',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () => controller.updateRating(index + 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      index < controller.userRating.value
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Please share your opinion\nabout the service',
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: TextField(
              maxLines: 4,
              onChanged: (value) => controller.reviewMessage.value = value,
              decoration: InputDecoration(
                hintText: 'message',
                hintStyle: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Send Review',
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  static void show(BuildContext context, UserProviderDetailsController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => UserAddReviewBottomSheet(controller: controller),
    );
  }
}
