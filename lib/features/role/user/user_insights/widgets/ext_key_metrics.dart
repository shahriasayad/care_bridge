import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

/// Progress-bar list showing compliance for key health metrics.
class KeyMetricsWidget extends StatelessWidget {
  const KeyMetricsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const metricsData = [
      MetricData(label: 'Food Logging', valueText: '92%', value: 0.92), // Fixed values to match visual
      MetricData(label: 'Protein Goal', valueText: '92%', value: 0.92),
      MetricData(label: 'Water Goal', valueText: '92%', value: 0.92),
      MetricData(label: 'Exercise Completions', valueText: '92%', value: 0.92),
      MetricData(label: 'Late night eating', valueText: '3 days', value: 0.33),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Key Metrics'),
        const SizedBox(height: 16),
        ...metricsData.map((data) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: KeyMetricRow(
                label: data.label,
                valueText: data.valueText,
                value: data.value,
              ),
            )),
      ],
    );
  }
}

class MetricData {
  final String label;
  final String valueText;
  final double value;
  
  const MetricData({
    required this.label,
    required this.valueText,
    required this.value,
  });
}

class KeyMetricRow extends StatelessWidget {
  final String label;
  final String valueText;
  final double value;

  const KeyMetricRow({
    super.key,
    required this.label,
    required this.valueText,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandDarkTextColor = Color(0xFF1E1915); 

    return SoftCard(
      // PERFECT MATCH: Exact card color sampled from your image
      color: const Color(0xFFF0F9E9), 
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryTextColor2,
                  ),
                ),
              ),
              Text(
                valueText,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondaryTextColor2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          InsightProgressBar(value: value),
        ],
      ),
    );
  }
}