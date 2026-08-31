import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_success_details_table.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_success_header.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/widgets/user_success_provider_info.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserBookingSuccessScreen extends StatelessWidget {
  const UserBookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments as Map<String, dynamic>;
    final UserProviderModel provider = data['provider'];
    final UserServiceModel service = data['service'];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const UserSuccessHeader(),
              const SizedBox(height: 24),
              UserSuccessProviderInfo(provider: provider),
              const SizedBox(height: 24),
              UserSuccessDetailsTable(
                serviceName: service.name,
                date: data['date'],
                time: data['time'],
                platformFee: data['platformFee'],
                total: data['total'],
              ),
              const Spacer(),
              _buildBottomButtons(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Add to calendar',
            backgroundColor: AppColors.iconBackground,
            textColor: AppColors.iconColor,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            text: 'Go to Appointments',
            onTap: () => Get.offAllNamed(AppRoutes.bottomNavScreen),
          ),
        ),
      ],
    );
  }
}
