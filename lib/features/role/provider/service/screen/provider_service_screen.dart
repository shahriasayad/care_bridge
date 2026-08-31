import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/service/controller/service_controller.dart';
import 'package:care_bridge/features/role/provider/service/model/service_model.dart';
import 'package:care_bridge/features/role/provider/service/widgets/add_edit_service_page.dart';
import 'package:care_bridge/features/role/provider/service/widgets/service_card.dart';
class ProviderServiceScreen extends StatelessWidget {
  ProviderServiceScreen({super.key});
  final controller = Get.put(ServiceController());
  void _showRemoveConfirmation(BuildContext context, ServiceModel service) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Remove Service',
          style: getTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),
        content: Text(
          'Are you sure you want to remove "${service.title}"?',
          style: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              controller.removeService(service.id);
              Get.back();
            },
            child: Text(
              'Remove',
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.cancelledColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: 'Services',
                showBackButton: true,
                showNotificationButton: false,
              ),
              //    const SizedBox(height: 16),
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
              Expanded(
                child: Obx(() {
                  final filtered = controller.filteredServices;
                  if (filtered.isEmpty) {
                    return Center(
                      child: Text(
                        'No services found',
                        style: getTextStyle(
                          fontSize: 16,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: filtered.length,
                    //  padding: const EdgeInsets.only(bottom: 40),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final service = filtered[index];
                      return ServiceCard(
                        service: service,
                        onEdit: () {
                          controller.prepareForEdit(service);
                          Get.to(() => AddEditServicePage(service: service));
                        },
                        onRemove: () =>
                            _showRemoveConfirmation(context, service),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 3),
        child: GestureDetector(
          onTap: () {
            controller.prepareForAdd();
            Get.to(() => const AddEditServicePage());
          },
          child: Image.asset(
            IconPath.floatingActionButton,
            height: 56,
            width: 56,
          ),
        ),
      ),
    );
  }
}
