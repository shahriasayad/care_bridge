import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_bar_chart.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_line_chart.dart';

class ChartsTab extends StatelessWidget {
  final ClientDetailsController controller;

  const ChartsTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        if (controller.dailyCaloriesBarChart != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ClientBarChart(data: controller.dailyCaloriesBarChart!),
          ),

        ...controller.trendCharts.map((chartData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ClientLineChart(data: chartData),
          );
        }),

        const SizedBox(height: 16),
        _buildBottomActionButtons(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildBottomActionButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(text: 'Message', onTap: () {}),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(text: 'Complete', onTap: () {}),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                backgroundColor: AppColors.backgroundColor,
                text: 'Cancel',
                textColor: AppColors.primaryButtonColor,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(text: 'Download Report', onTap: () {}),
            ),
          ],
        ),
      ],
    );
  }
}
