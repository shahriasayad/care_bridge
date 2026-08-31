import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/controller/user_services_controller.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/widgets/user_category_selector.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/widgets/user_provider_card.dart';

class UserServicesScreen extends StatelessWidget {
  const UserServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserServicesController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomAppBar(
                title: 'Care',
                showBackButton: false,
                showNotificationButton: false,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _SearchBar(controller: controller),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: UserCategorySelector(controller: controller),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => Text(
                  '${controller.filteredProviders.length} Providers Available',
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => controller.filteredProviders.isEmpty
                    ? Center(
                        child: Text(
                          'No providers found',
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20)
                            .copyWith(bottom: 24),
                        itemCount: controller.filteredProviders.length,
                        itemBuilder: (context, index) {
                          return UserProviderCard(
                            provider: controller.filteredProviders[index],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final UserServicesController controller;
  const _SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) => controller.searchQuery.value = value,
        style: getTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryTextColor,
        ),
        decoration: InputDecoration(
          hintText: 'Search Cares...',
          hintStyle: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.secondaryTextColor,
            size: 22,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
