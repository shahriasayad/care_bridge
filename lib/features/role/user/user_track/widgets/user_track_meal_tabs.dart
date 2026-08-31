import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_track/controller/user_track_meal_controller.dart';

class UserTrackMealTabs extends StatelessWidget {
  final UserTrackMealController controller;
  const UserTrackMealTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const tabs = [
      TabInfo(icon: IconPath.cameraIcon, label: 'Camera'),
      TabInfo(icon: IconPath.voiceIcon, label: 'Voice'),
      TabInfo(icon: IconPath.textIcon, label: 'Text'),
    ];

    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          tabs.length,
          (index) => GestureDetector(
            onTap: () => controller.selectTab(index),
            child: TabItem(
              icon: tabs[index].icon,
              label: tabs[index].label,
              isSelected: controller.selectedTab.value == index,
            ),
          ),
        ),
      ),
    );
  }
}

class TabInfo {
  final String icon;
  final String label;
  const TabInfo({required this.icon, required this.label});
}

class TabItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;

  const TabItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.providerCardBackgroundColor
                  : AppColors.iconBackground,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primaryButtonColor.withValues(
                          alpha: 0.30,
                        ),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: Image.asset(
                icon,
                color: isSelected ? Colors.white : AppColors.iconColor,
                width: 24,
                height: 24,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.iconColor
                  : AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
