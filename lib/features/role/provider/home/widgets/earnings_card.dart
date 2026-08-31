import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/home/model/provider_home_data.dart';
import 'package:care_bridge/features/role/provider/home/widgets/sparkline_chart.dart';

class EarningsCard extends StatelessWidget {
  final ProviderDashboardData data;

  const EarningsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF6F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(IconPath.totalEarningIcon, height: 32, width: 32),
          const SizedBox(height: 12),
          Text(
            '\$${data.earningsValue}',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Total Earnings',
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.earningsChange,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textWithgreen,
            ),
          ),
          SizedBox(height: 12),

          SizedBox(
            height: 42,
            width: double.infinity,
            child: SparklineChart(
              data: data.earningsSparkline,
              color: AppColors.textWithgreen,
              strokeWidth: 1.0,
              fill: true,
            ),
          ),
        ],
      ),
    );
  }
}
