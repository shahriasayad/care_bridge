import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class SleepStagesCard extends StatelessWidget {
  const SleepStagesCard({super.key});

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
            'Sleep Stages',
            style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 12,
              child: Row(
                children: [
                  Expanded(flex: 25, child: Container(color: Colors.blue[800])),
                  Expanded(flex: 30, child: Container(color: Colors.purple)),
                  Expanded(flex: 45, child: Container(color: Colors.blue[300])),
                  Expanded(flex: 5, child: Container(color: Colors.amber)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StageLegend(
                color: Colors.blue[800]!,
                label: 'Deep',
                duration: '1h 45m (25%)',
              ),
              _StageLegend(
                color: Colors.purple,
                label: 'REM',
                duration: '2h 10m (30%)',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StageLegend(
                color: Colors.blue[300]!,
                label: 'Light',
                duration: '3h 15m (45%)',
              ),
              _StageLegend(
                color: Colors.amber,
                label: 'Awake',
                duration: '25m (5%)',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Your deep sleep and REM sleep ratios are within the healthy range, supporting active brain and muscle recovery.',
            style: getTextStyle(
              fontSize: 13,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _StageLegend extends StatelessWidget {
  final Color color;
  final String label;
  final String duration;

  const _StageLegend({
    required this.color,
    required this.label,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          duration,
          style: getTextStyle(
            fontSize: 11,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
