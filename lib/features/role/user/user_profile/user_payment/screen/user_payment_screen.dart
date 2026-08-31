import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_profile/user_payment/controller/user_payment_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/user_payment/model/user_payment_model.dart';

class UserPaymentScreen extends StatelessWidget {
  const UserPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserPaymentController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Payment Methods',
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 24),
              ...controller.methods.map(
                (m) => _PaymentTile(method: m, controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  final UserPaymentModel method;
  final UserPaymentController controller;

  const _PaymentTile({required this.method, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selected.value?.id == method.id;
      return GestureDetector(
        onTap: () => controller.select(method),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.providerCardBackgroundColor,  
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              const _StripeLogo(),
              const SizedBox(width: 12),
              Text(
                method.name,
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _StripeLogo extends StatelessWidget {
  const _StripeLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      IconPath.stripeLogo,
      height: 24,
      width: 48,
      fit: BoxFit.contain,
    );
  }
}
