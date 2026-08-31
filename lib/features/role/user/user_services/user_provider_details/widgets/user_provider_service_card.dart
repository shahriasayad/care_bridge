import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/controller/user_provider_details_controller.dart';

class UserProviderServiceCard extends StatelessWidget {
  final UserProviderDetailsController controller;
  final int index;
  final UserServiceModel service;

  const UserProviderServiceCard({
    super.key,
    required this.controller,
    required this.index,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedServiceIndex.value == index;
      return GestureDetector(
        onTap: () => controller.selectService(index),
        child: Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 14,
                          color: AppColors.secondaryTextColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          service.duration,
                          style: getTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$${service.price.toStringAsFixed(0)}',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryButtonColor,
                      ),
                    ),
                  ],
                ),
              ),
              _RadioDot(isSelected: isSelected),
            ],
          ),
        ),
      );
    });
  }
}

class _RadioDot extends StatelessWidget {
  final bool isSelected;
  const _RadioDot({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppColors.primaryButtonColor
              : Colors.grey.shade400,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryButtonColor,
                ),
              ),
            )
          : null,
    );
  }
}
