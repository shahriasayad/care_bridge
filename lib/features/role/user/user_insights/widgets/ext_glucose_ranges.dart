import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class GlucoseRangesCard extends StatelessWidget {
  const GlucoseRangesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.scoreCardBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Glucose Ranges',
            style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 16),
          const _RangeRow(
            label: 'Very High (>250)',
            percentage: 0.0,
            percentText: '0%',
            color: Colors.red,
          ),
          const _RangeRow(
            label: 'High (180-250)',
            percentage: 0.02,
            percentText: '2%',
            color: Colors.orange,
          ),
          const _RangeRow(
            label: 'In Range (70-180)',
            percentage: 0.88,
            percentText: '88%',
            color: Colors.green,
          ),
          const _RangeRow(
            label: 'Low (54-70)',
            percentage: 0.08,
            percentText: '8%',
            color: Colors.lightBlue,
          ),
          _RangeRow(
            label: 'Very Low (<54)',
            percentage: 0.02,
            percentText: '2%',
            color: Colors.blue[900]!,
          ),
        ],
      ),
    );
  }
}

class _RangeRow extends StatelessWidget {
  final String label;
  final double percentage;
  final String percentText;
  final Color color;

  const _RangeRow({
    required this.label,
    required this.percentage,
    required this.percentText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: getTextStyle(
                  fontSize: 12,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              Text(
                percentText,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 8,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
