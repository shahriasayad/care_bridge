import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/score_progress_row.dart';

class ClientComplianceSection extends StatelessWidget {
  final ClientDetailsController controller;

  const ClientComplianceSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...controller.compliance.map((item) {
          return ScoreProgressRow(
            title: item['title'],
            score: item['score'],
            isPercentage: true,
          );
        }),
        const SizedBox(height: 20),
        _buildBottomActionButtons(),
      ],
    );
  }

  Widget _buildBottomActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            radius: 12,
            text: 'Message',
            onTap: () {
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            radius: 12,
            text: 'Complete',
            onTap: () {
            },
          ),
        ),
      ],
    );
  }
}
