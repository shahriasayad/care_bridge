import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_appointments/controller/user_appointments_controller.dart';
import 'package:care_bridge/features/role/user/user_appointments/model/user_appointment_model.dart';

class UserAppointmentsScreen extends StatelessWidget {
  const UserAppointmentsScreen({super.key});

  Color _getStatusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'upcoming':
        return AppColors.upcomingColor;
      case 'completed':
        return AppColors.completedColor;
      case 'canceled':
      case 'cancelled':
        return AppColors.cancelledColor;
      default:
        return Colors.grey;
    }
  }

  Widget _buildSearchBar(UserAppointmentsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextField(
        onChanged: controller.onSearchChanged,
        style: getTextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Search Services...',
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

  Widget _buildFilterTabs(UserAppointmentsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final selectedIndex = controller.selectedFilterIndex.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTabItem(0, 'All', selectedIndex == 0, controller),
            _buildTabItem(1, 'Upcoming (10)', selectedIndex == 1, controller),
            _buildTabItem(2, 'Completed (5)', selectedIndex == 2, controller),
          ],
        );
      }),
    );
  }

  Widget _buildTabItem(
    int index,
    String label,
    bool isSelected,
    UserAppointmentsController controller,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectFilter(index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.iconColor : const Color(0xFFFAF2EC),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              label,
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.secondaryTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(
    UserAppointmentModel appointment,
    UserAppointmentsController controller,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  appointment.doctorAvatar,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 48,
                    height: 48,
                    color: Colors.white,
                    child: const Icon(Icons.person, size: 28),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctorName,
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appointment.service,
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: AppColors.secondaryTextColor,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          appointment.time,
                          style: getTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.secondaryTextColor,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          appointment.date,
                          style: getTextStyle(
                            fontSize: 11,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusBgColor(appointment.status),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      appointment.status,
                      style: getTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '\$${appointment.price.toStringAsFixed(0)}',
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildCardButton(
                  text: 'Reschedule',
                  bgColor: AppColors.primaryButtonColor,
                  textColor: Colors.white,
                  onTap: () => controller.rescheduleAppointment(appointment),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildCardButton(
                  text: 'Message',
                  bgColor: AppColors.primaryButtonColor,
                  textColor: Colors.white,
                  onTap: () => controller.messageDoctor(appointment),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildCardButton(
                  text: 'Cancel',
                  bgColor: AppColors.deleteBackground,
                  textColor: AppColors.cancelledColor,
                  onTap: () => controller.cancelAppointment(appointment),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardButton({
    required String text,
    required Color bgColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserAppointmentsController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: CustomAppBar(
                title: 'My Appointments',
                showBackButton: true,
                showNotificationButton: false,
              ),
            ),
            _buildSearchBar(controller),
            _buildFilterTabs(controller),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                final list = controller.filteredAppointments;
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      'No appointments found',
                      style: getTextStyle(
                        fontSize: 16,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return _buildAppointmentCard(list[index], controller);
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
