import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/user_help_support/controller/user_help_support_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/user_help_support/model/user_help_support_model.dart';

class UserHelpSupportScreen extends StatelessWidget {
  const UserHelpSupportScreen({super.key});

  Widget _buildSearchBar(UserHelpSupportController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextField(
        onChanged: controller.onSearchChanged,
        style: getTextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Search helps...',
          hintStyle: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor.withValues(alpha: 0.6),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.secondaryTextColor,
          ),
          filled: true,
          fillColor: Color(0xFFFDF9F6),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    UserHelpSupportCategoryModel category,
    UserHelpSupportController controller,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.selectCategory(category),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: category.iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(category.icon, color: category.iconColor, size: 24),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category.description,
                    style: getTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF2EC),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chevron_right_rounded,
                size: 16,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserHelpSupportController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: CustomAppBar(
                title: 'Help & Support',
                showBackButton: true,
                showNotificationButton: false,
              ),
            ),
            _buildSearchBar(controller),
            Expanded(
              child: Obx(() {
                final list = controller.filteredCategories;
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      'No topics found',
                      style: getTextStyle(
                        fontSize: 16,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryItem(list[index], controller);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
