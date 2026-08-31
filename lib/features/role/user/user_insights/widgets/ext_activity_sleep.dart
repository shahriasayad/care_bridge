import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_painters.dart';

/// Three semi-circle gauges: Resting HR, Average HR, and Max HR.
class HeartRateGaugesCard extends StatelessWidget {
  const HeartRateGaugesCard({super.key});

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
            'Resting & Active Heart Rate',
            style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SemiCircleGaugeWidget(
                valuePct: 0.62,
                value: '62 bpm',
                label: 'Resting HR',
                color: Colors.blue,
              ),
              SemiCircleGaugeWidget(
                valuePct: 0.76,
                value: '76 bpm',
                label: 'Average HR',
                color: Colors.orange,
              ),
              SemiCircleGaugeWidget(
                valuePct: 0.72,
                value: '145 bpm',
                label: 'Max HR',
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A labelled semi-circle gauge widget.
class SemiCircleGaugeWidget extends StatelessWidget {
  final double valuePct;
  final String value;
  final String label;
  final Color color;

  const SemiCircleGaugeWidget({
    super.key,
    required this.valuePct,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 48,
          child: CustomPaint(
            painter: SemiCircleGaugePainter(valuePct: valuePct, color: color),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  value,
                  style: getTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: getTextStyle(
            fontSize: 11,
            color: AppColors.secondaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
