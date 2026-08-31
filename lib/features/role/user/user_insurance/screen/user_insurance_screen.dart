import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insurance/controller/user_insurance_controller.dart';
import 'package:care_bridge/features/role/user/user_insurance/widgets/user_insurance_card_widgets.dart';

class UserInsuranceScreen extends StatelessWidget {
  const UserInsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserInsuranceController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomAppBar(
              title: 'Insurance',
              showBackButton: true,
              showNotificationButton: false,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SearchBar(onChanged: controller.onSearchChanged),
          const SizedBox(height: 20),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Total ${controller.total}',
                style: getTextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Obx(
              () => ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                itemCount: controller.filteredInsurances.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, index) => InsuranceCardWidget(
                  insurance: controller.filteredInsurances[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const _SearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextField(
        onChanged: onChanged,
        style: getTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryTextColor,
        ),
        decoration: InputDecoration(
          hintText: 'Search Insurance...',
          hintStyle: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.secondaryTextColor,
          ),
          filled: true,
          fillColor: AppColors.backgroundColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
        ),
      ),
    );
  }
}
