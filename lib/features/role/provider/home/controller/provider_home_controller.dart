import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/home/model/provider_home_data.dart';

class ProviderHomeController extends GetxController {
  final selectedTimeframe = 'Weekly'.obs;
  final isLoading = false.obs;
  final dashboardData = Rxn<ProviderDashboardData>();

  @override
  void onInit() {
    super.onInit();
    _loadDashboardData();
  }

  void setTimeframe(String value) {
    if (selectedTimeframe.value != value) {
      selectedTimeframe.value = value;
      _loadDashboardData();
    }
  }

  Future<void> _loadDashboardData() async {
    isLoading.value = true;

    // Simulate API fetch delay
    await Future.delayed(const Duration(milliseconds: 300));

    if (selectedTimeframe.value == 'Weekly' ||
        selectedTimeframe.value == 'Monthly' ||
        selectedTimeframe.value == 'Yearly') {
      dashboardData.value = ProviderDashboardData(
        greetingName: 'Dr David',
        earningsValue: '120',
        earningsChange: '+12 this week',
        earningsSparkline: [80, 85, 90, 88, 120, 110, 115, 120],
        summaryCards: [
          DashboardSummaryCard(
            title: 'Total Patients',
            value: '10',
            changeText: '+12 this week',
            isPositive: true,
            sparklineData: [5, 6, 8, 7, 9, 8, 9, 10],
            iconurl: IconPath.patientIcon,
            themeColor: const Color(0xFF16A34A),
          ),
          DashboardSummaryCard(
            title: 'Appointments',
            value: '10',
            changeText: '+12 this week',
            isPositive: true,
            sparklineData: [4, 6, 5, 8, 7, 9, 8, 10],
            iconurl: IconPath.appoinmenticon,
            themeColor: const Color(0xFFD1763F),
          ),
          DashboardSummaryCard(
            title: 'Completed',
            value: '10',
            changeText: '78% of total',
            isPositive: true,
            sparklineData: [3, 5, 4, 6, 8, 7, 9, 10],
            iconurl: IconPath.completedIcon,
            themeColor: const Color(0xFF7597BE),
          ),
          DashboardSummaryCard(
            title: 'No Show',
            value: '28',
            changeText: '78% of total',
            isPositive: false,
            sparklineData: [15, 18, 14, 22, 25, 20, 24, 28],
            iconurl: IconPath.notShowicon,
            themeColor: const Color(0xFF72709B),
          ),
        ],
        overallHealthScore: 80,
        healthScoreText: 'Good',
        healthSegments: [
          HealthOverviewSegment(
            label: 'Excellent',
            percentage: 30,
            color: const Color(0xFF16A34A),
          ),
          HealthOverviewSegment(
            label: 'Fair',
            percentage: 20,
            color: const Color(0xFFE8F6ED),
          ),
          HealthOverviewSegment(
            label: 'Good',
            percentage: 25,
            color: const Color(0xFFEBBC6E),
          ),
          HealthOverviewSegment(
            label: 'Poor',
            percentage: 15,
            color: const Color(0xFFD76A62),
          ),
          HealthOverviewSegment(
            label: 'No Data',
            percentage: 10,
            color: const Color(0xFFB7B4AE),
          ),
        ],
        healthAreas: [
          HealthAreaItem(
            name: 'Weight Management',
            percentage: 40,
            isUpward: true,
            icon: Icons.monitor_weight_outlined,
            iconColor: const Color(0xFF10B981),
          ),
          HealthAreaItem(
            name: 'Nutrition',
            percentage: 40,
            isUpward: false,
            icon: Icons.restaurant,
            iconColor: const Color(0xFFEF4444),
          ),
          HealthAreaItem(
            name: 'Sleep',
            percentage: 40,
            isUpward: true,
            icon: Icons.nights_stay_outlined,
            iconColor: const Color(0xFF3B82F6),
          ),
          HealthAreaItem(
            name: 'Mental Wellbeing',
            percentage: 40,
            isUpward: true,
            icon: Icons.psychology_outlined,
            iconColor: const Color(0xFFEC4899),
          ),
          HealthAreaItem(
            name: 'Physical Activity',
            percentage: 40,
            isUpward: true,
            icon: Icons.directions_run,
            iconColor: const Color(0xFFF59E0B),
          ),
        ],
        engagementCards: [
          EngagementCard(
            title: 'Message Sent',
            value: '28',
            changeText: '+12%',
            isPositive: true,
            icon: Icons.chat_bubble_outline,
            iconColor: const Color(0xFF10B981),
            backgroundColor: const Color(0xFFF2FAEC),
          ),
          EngagementCard(
            title: 'Care Plan Shared',
            value: '28',
            changeText: '+12%',
            isPositive: true,
            icon: Icons.assignment_outlined,
            iconColor: const Color(0xFF3B82F6),
            backgroundColor: const Color(0xFFE9EFFD),
          ),
          EngagementCard(
            title: 'Patient Feedback',
            value: '4.8/5',
            changeText: '+0.3',
            isPositive: true,
            icon: Icons.star_border,
            iconColor: const Color(0xFFF59E0B),
            backgroundColor: const Color(0xFFFAF3E6),
          ),
          EngagementCard(
            title: 'New Patients',
            value: '9',
            changeText: '+12%',
            isPositive: true,
            icon: Icons.person,
            iconColor: const Color(0xFF8B5CF6),
            backgroundColor: const Color(0xFFEBEAFF),
          ),
        ],
      );

      isLoading.value = false;
    }
  }
}
