import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/controller/user_booking_controller.dart';

class UserSelectDateTimeView extends StatelessWidget {
  final UserBookingController controller;
  const UserSelectDateTimeView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick a Time that Works for You',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildSelectedServiceCard(),
          const SizedBox(height: 24),
          _buildMonthHeader(),
          const SizedBox(height: 16),
          _buildHorizontalCalendar(),
          const Divider(color: AppColors.borderColor, height: 1),
          const SizedBox(height: 20),
          Obx(() => Text(
                controller.formattedDate,
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              )),
          const SizedBox(height: 16),
          _buildTimeSlots(),
        ],
      ),
    );
  }

  Widget _buildSelectedServiceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
                  controller.selectedService.name,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${controller.selectedService.price.toStringAsFixed(0)}',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryButtonColor,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => controller.currentStep.value = 1,
            child: Text(
              'Change',
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryButtonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.iconBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.chevron_left, color: Colors.grey, size: 20),
          ),
        ),
        Text(
          'January 2026',
          style: getTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.iconBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalCalendar() {
    final daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return Container(
      height: 75,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          final dayNum = index + 1;
          final dayName = daysOfWeek[index];
          return Obx(() {
            final isSelected = controller.selectedDate.value.day == dayNum;
            return GestureDetector(
              onTap: () {
                final now = controller.selectedDate.value;
                controller.selectDate(DateTime(now.year, now.month, dayNum));
              },
              child: Container(
                width: 44,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayName,
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? AppColors.providerCardBackgroundColor
                            : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$dayNum',
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 2,
                      width: 24,
                      color: isSelected
                          ? AppColors.providerCardBackgroundColor
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildTimeSlots() {
    final slots = ['10:00', '10:30', '12:00', '1:00'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: slots.map((time) {
          return Obx(() {
            final isSelected = controller.selectedTime.value == time;
            return GestureDetector(
              onTap: () => controller.selectTime(time),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.providerCardBackgroundColor
                      : AppColors.iconBackground,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  time,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.iconColor,
                  ),
                ),
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
