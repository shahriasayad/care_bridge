import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class BiometricsQuadrantCard extends StatelessWidget {
  const BiometricsQuadrantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scoreCardBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                const Expanded(
                  child: _BiometricQuadrantItem(
                    value: '7.2h',
                    label: 'Sleep Trend',
                    percentage: 0.72,
                    color: Color(0xFF7C82B8),
                    icon: Icons.nightlight_round,
                  ),
                ),
                Container(width: 1, color: AppColors.borderColor),
                const Expanded(
                  child: _BiometricQuadrantItem(
                    value: '84%',
                    label: 'Hydration',
                    percentage: 0.84,
                    color: Color(0xFF5C82A6),
                    icon: Icons.water_drop,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.borderColor),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _BiometricQuadrantItem(
                    value: '68 bpm',
                    label: 'Resting HR',
                    percentage: 0.68,
                    color: Colors.red[400]!,
                    icon: Icons.favorite,
                  ),
                ),
                Container(width: 1, color: AppColors.borderColor),
                Expanded(
                  child: _BiometricQuadrantItem(
                    value: '8,450',
                    label: 'Activity',
                    percentage: 0.845,
                    color: AppColors.primaryButtonColor,
                    icon: Icons.directions_run,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BiometricQuadrantItem extends StatelessWidget {
  final String value;
  final String label;
  final double percentage;
  final Color color;
  final IconData icon;

  const _BiometricQuadrantItem({
    required this.value,
    required this.label,
    required this.percentage,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 5,
                  backgroundColor: color.withOpacity(0.12),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Icon(icon, color: color.withOpacity(0.20), size: 28),
              Text(
                value,
                style: getTextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// Glucose monitoring overview — current reading, status badge, and summary.
class GlucoseOverviewCard extends StatelessWidget {
  const GlucoseOverviewCard({super.key});

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
            'Continuous Glucose Monitoring (CGM)',
            style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '110 mg/dL',
                style: getTextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.completedColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Normal',
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.completedColor,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'In Range: 88%',
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Your glucose levels have remained stable throughout the day with a healthy average.',
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
