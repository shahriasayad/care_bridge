import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

// 8. Habit Intelligence Widget
class HabitCircularGauge extends StatelessWidget {
  final String title;
  final String value;
  final double pct;
  final Color color;
  final bool isLarge;

  const HabitCircularGauge({
    super.key,
    required this.title,
    required this.value,
    required this.pct,
    required this.color,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final double gaugeSize = isLarge ? 86.0 : 60.0;
    final double strokeWidth = isLarge ? 6.0 : 4.5;
    final double valueFontSize = isLarge ? 14.0 : 11.0;
    final double titleFontSize = isLarge ? 9.0 : 7.0;
    final double subFontSize = isLarge ? 9.0 : 7.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: gaugeSize,
          height: gaugeSize,
          child: CircularProgressIndicator(
            value: pct,
            strokeWidth: strokeWidth,
            backgroundColor: color.withOpacity(0.15),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: getTextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF675B54),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: getTextStyle(
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF23140A),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Good',
                style: getTextStyle(
                  fontSize: subFontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4A5636),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HabitIntelligenceSection extends StatelessWidget {
  const HabitIntelligenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = [
      {
        'title': 'Protein\nBreakfast',
        'val': '80%',
        'pct': 0.80,
        'color': const Color(0xFFD47C5E),
      },
      {
        'title': 'Water\nGoal',
        'val': '80%',
        'pct': 0.80,
        'color': const Color(0xFF5C82A6),
      },
      {
        'title': 'Daily\nWalk',
        'val': '80%',
        'pct': 0.80,
        'color': const Color(0xFF4A5636),
      },
      {
        'title': 'No Late Night\nSnacks',
        'val': '80%',
        'pct': 0.80,
        'color': const Color(0xFF7C82B8),
      },
      {
        'title': 'Meditation',
        'val': '80%',
        'pct': 0.80,
        'color': const Color(0xFF656698),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Habit Intelligence'),
        const SizedBox(height: 16),
        // Large circles container (2 columns)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFFBF7F4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEADFD6), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HabitCircularGauge(
                title: habits[0]['title'] as String,
                value: habits[0]['val'] as String,
                pct: habits[0]['pct'] as double,
                color: habits[0]['color'] as Color,
                isLarge: true,
              ),
              HabitCircularGauge(
                title: habits[1]['title'] as String,
                value: habits[1]['val'] as String,
                pct: habits[1]['pct'] as double,
                color: habits[1]['color'] as Color,
                isLarge: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Small circles container (3 columns)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFBF7F4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEADFD6), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HabitCircularGauge(
                title: habits[2]['title'] as String,
                value: habits[2]['val'] as String,
                pct: habits[2]['pct'] as double,
                color: habits[2]['color'] as Color,
              ),
              HabitCircularGauge(
                title: habits[3]['title'] as String,
                value: habits[3]['val'] as String,
                pct: habits[3]['pct'] as double,
                color: habits[3]['color'] as Color,
              ),
              HabitCircularGauge(
                title: habits[4]['title'] as String,
                value: habits[4]['val'] as String,
                pct: habits[4]['pct'] as double,
                color: habits[4]['color'] as Color,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Separate No Late Night Snacks tracker container
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7EF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No Late Night Snacks',
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF23140A),
                    ),
                  ),
                  Text(
                    '62%',
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF23140A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const LinearProgressIndicator(
                  value: 0.62,
                  minHeight: 5,
                  backgroundColor: Color(0xFFEADFD6),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF9F6E4D),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const AiSummaryCard(
          title: 'AI Habit Analysis',
          text: 'The single highest-impact behavior appears to be breakfast protein intake. Patients days with: ≥30g breakfast protein show:\n\n• Better mood\n• Fewer cravings\n• Better adherence\n• Lower calorie intake',
        ),
      ],
    );
  }
}

// 9. Medication & Treatment Compliance Widget
class MedicationComplianceSection extends StatelessWidget {
  const MedicationComplianceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compliances = [
      {'title': 'Medication Adherence', 'score': '71%', 'progress': 0.71},
      {'title': 'Supplement Adherence', 'score': '95%', 'progress': 0.95},
      {'title': 'Therapy Attendance', 'score': '92%', 'progress': 0.92},
      {'title': 'Exercise Prescription Adherence', 'score': '61%', 'progress': 0.61},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Medication & Treatment Compliance'),
        const SizedBox(height: 16),
        ...compliances.map((c) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7EF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      c['title'] as String,
                      style: getTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF23140A),
                      ),
                    ),
                    Text(
                      c['score'] as String,
                      style: getTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF23140A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: LinearProgressIndicator(
                    value: c['progress'] as double,
                    minHeight: 5,
                    backgroundColor: const Color(0xFFEADFD6),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF9F6E4D),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 8),
        const AiSummaryCard(
          title: 'AI Compliance Analysis',
          text: 'Patient demonstrates excellent adherence overall. Missed medication events occur most frequently during weekends.',
        ),
      ],
    );
  }
}
