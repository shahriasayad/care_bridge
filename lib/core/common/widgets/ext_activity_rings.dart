import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_painters.dart';

class ActivityRingsWidget extends StatelessWidget {
  const ActivityRingsWidget({super.key});

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
            'Activity Progress',
            style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: ConcentricRingsPainter(
                    stepsPct: 0.84,
                    caloriesPct: 0.75,
                    minutesPct: 0.60,
                    stepsColor: AppColors.primaryButtonColor,
                    caloriesColor: AppColors.completedColor,
                    minutesColor: const Color(0xFF5A85A9),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ActivityMetricRow(
                      color: AppColors.primaryButtonColor,
                      label: 'Steps',
                      value: '8,450',
                      goal: '/ 10,000',
                    ),
                    const SizedBox(height: 10),
                    _ActivityMetricRow(
                      color: AppColors.completedColor,
                      label: 'Calories',
                      value: '450',
                      goal: '/ 600 kcal',
                    ),
                    const SizedBox(height: 10),
                    _ActivityMetricRow(
                      color: const Color(0xFF5A85A9),
                      label: 'Minutes',
                      value: '45',
                      goal: '/ 60 min',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityMetricRow extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  final String goal;

  const _ActivityMetricRow({
    required this.color,
    required this.label,
    required this.value,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: getTextStyle(
                  fontSize: 11,
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: value,
                      style: getTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    TextSpan(
                      text: goal,
                      style: getTextStyle(
                        fontSize: 11,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
