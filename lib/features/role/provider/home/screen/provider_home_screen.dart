import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:care_bridge/features/role/provider/home/controller/provider_home_controller.dart';
import 'package:care_bridge/features/role/provider/home/widgets/summary_card.dart';
import 'package:care_bridge/features/role/provider/home/widgets/earnings_card.dart';
import 'package:care_bridge/features/role/provider/home/widgets/health_overview_card.dart';
import 'package:care_bridge/features/role/provider/home/widgets/top_health_areas_card.dart';
import 'package:care_bridge/features/role/provider/home/widgets/upcoming_appointments_section.dart';
import 'package:care_bridge/features/role/provider/home/widgets/patient_engagement_grid.dart';

class ProviderHomeScreen extends StatelessWidget {
  ProviderHomeScreen({super.key});

  final controller = Get.put(ProviderHomeController());

  // Try to find bottom navigation controller to switch tabs
  BottomNavController? get _bottomNavController {
    try {
      return Get.find<BottomNavController>();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value ||
              controller.dashboardData.value == null) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.circularProgressIndicatorColor,
                ),
              ),
            );
          }

          final data = controller.dashboardData.value!;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImagePath.singleLogo, width: 33, height: 48),
                    GestureDetector(
                      onTap: () => Get.toNamed('/notificationsScreen'),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFAF2EC),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.notifications_none_rounded,
                            color: AppColors.secondaryTextColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning, ${data.greetingName} 🖐🏻',
                            style: getTextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                    const SizedBox(width: 200),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Here's an overview of your practice today",
                        style: getTextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 46),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        //  vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: EdgeInsets.zero,
                          value: controller.selectedTimeframe.value,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.secondaryTextColor,
                            size: 24,
                          ),
                          dropdownColor: Colors.white,
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryTextColor,
                          ),
                          items: ['Weekly', 'Monthly', 'Yearly'].map((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            if (newValue != null) {
                              controller.setTimeframe(newValue);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: data.summaryCards.length,
                  itemBuilder: (context, index) {
                    final card = data.summaryCards[index];
                    return SummaryCard(card: card);
                  },
                ),
                const SizedBox(height: 16),

                EarningsCard(data: data),
                const SizedBox(height: 32),

                Text(
                  'Patient Health Overview',
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 16),
                HealthOverviewCard(data: data),
                const SizedBox(height: 32),

                Text(
                  'Top Health Areas',
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 16),
                TopHealthAreasCard(data: data),
                const SizedBox(height: 32),

                // 7. Upcoming Appointments
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Appointments',
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Switch bottom navigation tab to appointments (index 1)
                        _bottomNavController?.currentIndex.value = 1;
                      },
                      child: Text(
                        'View Details',
                        style: getTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryButtonColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const UpcomingAppointmentsSection(),
                const UpcomingAppointmentsSection(),
                const UpcomingAppointmentsSection(),
                const UpcomingAppointmentsSection(),
                const SizedBox(height: 32),

                // 8. Patient Engagement
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Patient Engagement',
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: Text(
                        controller.selectedTimeframe.value,
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PatientEngagementGrid(data: data),
              ],
            ),
          );
        }),
      ),
    );
  }
}
