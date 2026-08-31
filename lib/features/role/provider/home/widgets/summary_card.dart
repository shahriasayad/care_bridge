import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/home/model/provider_home_data.dart';
import 'package:care_bridge/features/role/provider/home/widgets/sparkline_chart.dart';

class SummaryCard extends StatelessWidget {
  final DashboardSummaryCard card;

  const SummaryCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF5F1ED),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(card.iconurl, height: 32, width: 32),
          SizedBox(height: 6),
          Text(
            card.value,
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          Text(
            card.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            card.changeText,
            style: getTextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: card.themeColor,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: SparklineChart(
              data: card.sparklineData,
              color: card.themeColor,
              strokeWidth: 1.5,
              fill: true,
            ),
          ),
        ],
      ),
    );
  }
}
