import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/appointment/model/appointment_model.dart';

class AppointmentController extends GetxController {
  final searchController = TextEditingController();
  final rxSearchQuery = ''.obs;

  final selectedTab = 'All'.obs;

  List<Map<String, String>> get tabs => [
        {'label': 'All', 'value': 'All'},
        {
          'label': 'Upcoming ($upcomingCount)',
          'value': 'Upcoming',
        },
        {
          'label': 'Completed ($completedCount)',
          'value': 'Completed',
        },
        {
          'label': 'Cancelled ($cancelledCount)',
          'value': 'Cancelled',
        },
      ];

  final appointments = <AppointmentModel>[
    AppointmentModel(
      avatarUrl: IconPath.user,
      name: 'Maria Gabriel',
      service: 'General Consultation',
      time: '10:00',
      date: 'Sunday, January 1',
      status: 'Upcoming',
      amount: '48',
    ),
    AppointmentModel(
      avatarUrl: IconPath.user,
      name: 'Dr. Sarah Chen',
      service: 'General Consultation',
      time: '10:00',
      date: 'Sunday, January 1',
      status: 'Completed',
      amount: '48',
    ),
    AppointmentModel(
      avatarUrl: IconPath.user,
      name: 'Shan Chi',
      service: 'General Consultation',
      time: '10:00',
      date: 'Sunday, January 1',
      status: 'Canceled',
      amount: '48',
    ),
    AppointmentModel(
      avatarUrl: IconPath.user,
      name: 'Dr. Sarah Chen',
      service: 'General Consultation',
      time: '10:00',
      date: 'Sunday, January 1',
      status: 'Completed',
      amount: '48',
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      rxSearchQuery.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  int get upcomingCount => appointments.where((a) => a.status.toLowerCase() == 'upcoming').length;
  int get completedCount => appointments.where((a) => a.status.toLowerCase() == 'completed').length;
  int get cancelledCount => appointments.where((a) => a.status.toLowerCase() == 'cancelled' || a.status.toLowerCase() == 'canceled').length;

  List<AppointmentModel> get filteredAppointments {
    return appointments.where((appointment) {
      if (selectedTab.value == 'Upcoming' && appointment.status.toLowerCase() != 'upcoming') {
        return false;
      }
      if (selectedTab.value == 'Completed' && appointment.status.toLowerCase() != 'completed') {
        return false;
      }
      if (selectedTab.value == 'Cancelled' &&
          appointment.status.toLowerCase() != 'cancelled' &&
          appointment.status.toLowerCase() != 'canceled') {
        return false;
      }

      if (rxSearchQuery.value.isNotEmpty) {
        final query = rxSearchQuery.value.toLowerCase();
        final nameMatches = appointment.name.toLowerCase().contains(query);
        final serviceMatches = appointment.service.toLowerCase().contains(query);
        return nameMatches || serviceMatches;
      }

      return true;
    }).toList();
  }

  void selectTab(String tab) {
    selectedTab.value = tab;
  }
}
