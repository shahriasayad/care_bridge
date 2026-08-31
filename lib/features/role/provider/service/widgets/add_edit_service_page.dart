import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/service/controller/service_controller.dart';
import 'package:care_bridge/features/role/provider/service/model/service_model.dart';

class AddEditServicePage extends StatelessWidget {
  final ServiceModel? service;

  const AddEditServicePage({super.key, this.service});

  static final _formKey = GlobalKey<FormState>();

  void _submit(ServiceController controller) {
    if (_formKey.currentState!.validate()) {
      controller.saveService(service?.id);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = service != null;
    final controller = Get.find<ServiceController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAppBar(
                  title: isEdit ? 'Edit Service' : 'Add Service',
                  showBackButton: true,
                  showNotificationButton: false,
                ),
                const SizedBox(height: 39),
                CustomTextFormField(
                  label: 'Service Name',
                  isRequired: true,
                  controller: controller.nameController,
                  hintText: 'Enter name',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter service name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                CustomTextFormField(
                  label: 'Price',
                  isRequired: true,
                  controller: controller.priceController,
                  hintText: 'Enter price',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter price';
                    }
                    if (double.tryParse(value.trim()) == null) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                CustomTextFormField(
                  label: 'Time',
                  isRequired: true,
                  controller: controller.timeController,
                  hintText: 'Enter time',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter time';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                CustomButton(
                  text: isEdit ? 'Save Changes' : 'Add Service',
                  onTap: () => _submit(controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
