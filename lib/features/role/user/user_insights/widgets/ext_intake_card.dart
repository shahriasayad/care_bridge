import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/health_score_widget.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_painters.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

class ActualIntakeCard extends StatelessWidget {
  const ActualIntakeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SoftCard(
          height: 128,
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Text(
                'Actual Intake',
                style: getTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0D12),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 138,
                height: 72,
                child: CustomPaint(
                  painter: SemiGaugePainter(
                    value: 1842 / 2200,
                    color: const Color(0xFFC79543),
                    trackColor: const Color(0xFFD8C7B9),
                    strokeWidth: 5,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '1842',
                            style: getTextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'kcal',
                            style: getTextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: SummaryCard(
                title: 'Daily Target',
                value: '1700',
                unit: 'Kcal',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: SummaryCard(
                title: 'Difference',
                value: '+142',
                unit: 'Kcal',
                valueColor: Color(0xFFB4774E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Circular ring gauge for a single macro nutrient.
/// Uses [HealthScoreWidget] from core for the progress ring.
class MacroGauge extends StatelessWidget {
  final String value;
  final String label;
  final String footer;

  final double percent;
  final Color color;

  const MacroGauge({
    super.key,
    required this.value,
    required this.label,
    required this.footer,
    required this.percent,
    this.color = const Color(0xFF9A6A4B),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HealthScoreWidget(
          // HealthScoreWidget expects score in 0–100 range
          score: (percent * 100).clamp(0.0, 100.0),
          size: 78,
          progressColor: color,
          backgroundColor: const Color(0xFFE6DAD2),
          strokeWidth: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                label,
                style: getTextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          footer,
          style: getTextStyle(fontSize: 9, color: const Color(0xFF66584F)),
        ),
      ],
    );
  }
}
