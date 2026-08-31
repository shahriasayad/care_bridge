import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/common/widgets/upcoming_today_widget.dart';
import 'package:care_bridge/features/role/provider/appointment/controller/appointment_controller.dart';

class UpcomingAppointmentsSection extends StatelessWidget {
  const UpcomingAppointmentsSection({super.key});

  AppointmentController get _appointmentController {
    if (Get.isRegistered<AppointmentController>()) {
      return Get.find<AppointmentController>();
    } else {
      return Get.put(AppointmentController());
    }
  }

  @override
  Widget build(BuildContext context) {
    final appointmentController = _appointmentController;
    
    return Obx(() {
      final upcoming = appointmentController.appointments
          .where((a) => a.status.toLowerCase() == 'upcoming')
          .take(3)
          .toList();

      if (upcoming.isEmpty) {
        return Container(
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Text(
            'No upcoming appointments today',
            style: getTextStyle(
              fontSize: 14,
              color: AppColors.secondaryTextColor,
            ),
          ),
        );
      }

      return Column(
        children: upcoming.map((appointment) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: UpcomingTodayWidget(
              avatarUrl: appointment.avatarUrl,
              name: appointment.name,
              service: appointment.service,
              time: appointment.time,
              date: appointment.date,
              status: appointment.status,
              amount: appointment.amount,
            ),
          );
        }).toList(),
      );
    });
  }
}
