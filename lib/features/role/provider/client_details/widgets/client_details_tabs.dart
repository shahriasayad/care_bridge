import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';

class ClientDetailsTabs extends StatelessWidget {
  final ClientDetailsController controller;

  const ClientDetailsTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ['Overview', 'History', 'Booking Info', 'Charts', 'Nutrition'].map((tab) {
            final bool isSelected = controller.selectedTab.value == tab;
            return GestureDetector(
              onTap: () => controller.selectedTab.value = tab,
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF9F6E4D)
                      : const Color(0xFFFAF2EC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tab,
                  style: getTextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xFF8F6343),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
