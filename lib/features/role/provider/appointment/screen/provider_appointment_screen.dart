import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/appointment/controller/appointment_controller.dart';
import 'package:care_bridge/features/role/provider/appointment/widgets/appointment_card.dart';

class ProviderAppointmentScreen extends StatelessWidget {
  ProviderAppointmentScreen({super.key});

  final controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Appointments',
                showBackButton: false,
                showNotificationButton: false,
              ),
              CustomTextFormField(
                label: '',
                controller: controller.searchController,
                hintText: 'Search Services...',
                prefixIcon: const Icon(
                  Icons.search_sharp,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.
                    tabs.map((tab) {
                      final isSelected =
                          controller.selectedTab.value == tab['value'];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: () => controller.selectTab(tab['value']!),
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.iconColor
                                  : AppColors.tertiaryTextColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              tab['label']!,
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? AppColors.tertiaryTextColor
                                    : AppColors.circularProgressIndicatorColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
              const SizedBox(height: 24),
              // Appointments List
              Expanded(
                child: Obx(() {
                  final filtered = controller.filteredAppointments;
                  if (filtered.isEmpty) {
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
                    itemCount: filtered.length,
                    padding: const EdgeInsets.only(bottom: 24),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final appointment = filtered[index];
                      return AppointmentCard(
                        appointment: appointment,
                        onMessageTap: () {
                          EasyLoading.showToast(
                            'Messaging ${appointment.name}...',
                            duration: const Duration(seconds: 1),
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
