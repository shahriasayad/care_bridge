import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_painters.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

// 6. Nutrition & Intelligence Widget
class NutritionIntelligenceSection extends StatelessWidget {
  const NutritionIntelligenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {'title': 'Calories', 'value': '1,725/day'},
      {'title': 'Protein', 'value': '112g/day'},
      {'title': 'Carbohydrates', 'value': '165g/day'},
      {'title': 'Fat', 'value': '61g/day'},
      {'title': 'Fiber', 'value': '18g/day'},
      {'title': 'Water', 'value': '82 oz/day'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Nutrition & Intelligence'),
        const SizedBox(height: 16),
        GridMetrics(metrics: metrics),
        const SizedBox(height: 16),
        const AiSummaryCard(
          title: 'AI Nutrition Analysis',
          text: 'Breakfast protein strongly predicts adherence later in the day. Weekend calorie intake averages 22% higher than weekdays. Fiber remains below target. Hydration is excellent.',
        ),
      ],
    );
  }
}

// 7. Symptom Tracking Widget
class SymptomTrackingSection extends StatelessWidget {
  const SymptomTrackingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final symptoms = [
      {'title': 'Fatigue', 'value': 'Moderate', 'pct': 0.6, 'color': const Color(0xFFD47C5E)},
      {'title': 'Headaches', 'value': '2/wk', 'pct': 0.4, 'color': const Color(0xFF7C82B8)},
      {'title': 'Brain Fog', 'value': 'Mild', 'pct': 0.3, 'color': const Color(0xFF5C82A6)},
      {'title': 'Pain', 'value': 'Low', 'pct': 0.2, 'color': const Color(0xFFC7A87E)},
      {'title': 'Digestive', 'value': 'Rare', 'pct': 0.1, 'color': const Color(0xFF4A5636)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Symptom Tracking'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFBF7F4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEADFD6), width: 1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSymptomItem(symptoms[0], const Size(64, 34)),
                  _buildSymptomItem(symptoms[1], const Size(64, 34)),
                  _buildSymptomItem(symptoms[2], const Size(64, 34)),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSymptomItem(symptoms[3], const Size(96, 50), isLarge: true),
                  _buildSymptomItem(symptoms[4], const Size(96, 50), isLarge: true),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const AiSummaryCard(
          title: 'AI Symptom Analysis',
          text: 'Reported fatigue increases significantly following nights with less than 6 hours of sleep. No dietary triggers have been consistently identified. Pattern suggests sleep-related fatigue rather than nutritional deficiency.',
        ),
      ],
    );
  }

  Widget _buildSymptomItem(Map<String, dynamic> s, Size gaugeSize, {bool isLarge = false}) {
    return SizedBox(
      width: gaugeSize.width,
      height: gaugeSize.height + (isLarge ? 12 : 8),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: gaugeSize.width,
            height: gaugeSize.height,
            child: CustomPaint(
              painter: SemiCircleGaugePainter(
                valuePct: s['pct'] as double,
                color: s['color'] as Color,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  s['title'] as String,
                  style: getTextStyle(
                    fontSize: isLarge ? 9 : 7,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF675B54),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  s['value'] as String,
                  style: getTextStyle(
                    fontSize: isLarge ? 13 : 10,
                    fontWeight: FontWeight.w600,
                    color: s['color'] as Color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Good',
                  style: getTextStyle(
                    fontSize: isLarge ? 9 : 7,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF4A5636),
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
