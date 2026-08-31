import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/controller/user_services_controller.dart';

class UserCategorySelector extends StatelessWidget {
  final UserServicesController controller;
  const UserCategorySelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: List.generate(controller.categories.length, (index) {
            final isSelected = controller.selectedCategoryIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectCategory(index),
              child: Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.providerCardBackgroundColor
                      : AppColors.iconBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  controller.categories[index],
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected
                        ? Colors.white
                        : AppColors.secondaryTextColor,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
