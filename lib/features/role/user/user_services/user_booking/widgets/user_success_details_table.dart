import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class UserSuccessDetailsTable extends StatelessWidget {
  final String serviceName;
  final String date;
  final String time;
  final double platformFee;
  final double total;

  const UserSuccessDetailsTable({
    super.key,
    required this.serviceName,
    required this.date,
    required this.time,
    required this.platformFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildDetailRow('Service', serviceName),
          const SizedBox(height: 16),
          _buildDetailRow('Date', date),
          const SizedBox(height: 16),
          _buildDetailRow('Time', time),
          const SizedBox(height: 16),
          _buildDetailRow('Platform Fee', '\$${platformFee.toInt()}'),
          const Divider(height: 32),
          _buildDetailRow('Total', '\$${total.toInt()}', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
        ),
        Text(
          value,
          style: getTextStyle(
            fontSize: 16,
            fontWeight:FontWeight.w400,
            color: isTotal
                ? AppColors.primaryButtonColor
                : AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
