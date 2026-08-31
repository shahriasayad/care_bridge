import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_details_header.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_details_tabs.dart';
import 'package:care_bridge/features/role/provider/client_details/tabs/overview_tab.dart';
import 'package:care_bridge/features/role/provider/client_details/tabs/history_tab.dart';
import 'package:care_bridge/features/role/provider/client_details/tabs/booking_info_tab.dart';
import 'package:care_bridge/features/role/provider/client_details/tabs/charts_tab.dart';
import 'package:care_bridge/features/role/provider/client_details/tabs/nutrition_tab.dart';

class ClientDetailsScreen extends GetView<ClientDetailsController> {
  const ClientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: 'Client Details',
                showBackButton: true,
                showNotificationButton: false,
              ),
              ClientDetailsHeader(controller: controller),
              const SizedBox(height: 20),
              ClientDetailsTabs(controller: controller),
              const SizedBox(height: 20),
              Obx(() {
                final selectedTab = controller.selectedTab.value;
                if (selectedTab == 'Overview') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClientProviderDetailsGrid(controller: controller),
                      const SizedBox(height: 24),
                      OverviewTab(controller: controller),
                    ],
                  );
                }
                if (selectedTab == 'History') {
                  return HistoryTab(controller: controller);
                }
                if (selectedTab == 'Booking Info') {
                  return BookingInfoTab(controller: controller);
                }
                if (selectedTab == 'Charts') {
                  return ChartsTab(controller: controller);
                }
                if (selectedTab == 'Nutrition') {
                  return const NutritionTab();
                }
                return const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
