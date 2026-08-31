import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/section_title.dart';

class HistoryTab extends StatelessWidget {
  final ClientDetailsController controller;

  const HistoryTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const SectionTitle(title: "Patient History Timeline"),
        const SizedBox(height: 16),
        ...controller.historyTimeline.map((item) => _buildTimelineItem(item)),
        const SizedBox(height: 40),
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
                backgroundColor: const Color(0xFFFAF1EC),
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

  Widget _buildTimelineItem(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['date'] ?? '',
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item['title'] ?? '',
            style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item['description'] ?? '',
            style: getTextStyle(
              fontSize: 12,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
