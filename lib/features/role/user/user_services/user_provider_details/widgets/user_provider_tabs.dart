import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/controller/user_provider_details_controller.dart';

class UserProviderTabs extends StatelessWidget {
  final UserProviderDetailsController controller;
  const UserProviderTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final provider = controller.provider;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTab(0, 'Services (8)'),
          _buildTab(1, 'Insurance (8)'),
          _buildTab(2, 'Reviews (8)'),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String label) {
    return Obx(() {
      final isSelected = controller.selectedTab.value == index;
      return GestureDetector(
        onTap: () => controller.selectTab(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.providerCardBackgroundColor
                : AppColors.iconBackground,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            label,
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.secondaryTextColor,
            ),
          ),
        ),
      );
    });
  }
}
