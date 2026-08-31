import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

// 1. Grovr AI Executive Summary Widget
class GrovrAiSummaryCard extends StatelessWidget {
  const GrovrAiSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = ['Sleep consistency', 'Stress management', 'Evening eating'];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF8F5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEADFD6), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF9F6E4D),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Grovr AI Executive Summary',
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF9F6E4D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Over the past 30 days, Sarah has demonstrated strong consistency with food logging, hydration, and daily movement. Weight has decreased by 7 lbs while maintaining stable energy. Sleep quality has declined by 14%, coinciding with increased stress ratings and elevated late-night snacking.\n\n"The strongest driver of positive outcomes remains high-protein breakfasts and consistent hydration."',
            style: getTextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF675B54),
            ).copyWith(height: 1.5),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEADFD6).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tag,
                  style: getTextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF675B54),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// 2. Whole Person Health Score Section Widget
class WholePersonHealthScoreSection extends StatelessWidget {
  const WholePersonHealthScoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    final scores = [
      {'title': 'Physical Health', 'score': '91/100', 'progress': 0.91},
      {'title': 'Activity', 'score': '91/100', 'progress': 0.91},
      {'title': 'Sleep', 'score': '74/100', 'progress': 0.74},
      {'title': 'Mental Wellness', 'score': '74/100', 'progress': 0.74},
      {'title': 'Recovery', 'score': '74/100', 'progress': 0.74},
      {'title': 'Hydration', 'score': '74/100', 'progress': 0.74},
      {'title': 'Medication Adherence', 'score': '74/100', 'progress': 0.74},
      {'title': 'Consistency', 'score': '74/100', 'progress': 0.74},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Whole Person Health Score'),
        const SizedBox(height: 16),
        ...scores.map((s) {
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
                      s['title'] as String,
                      style: getTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF23140A),
                      ),
                    ),
                    Text(
                      s['score'] as String,
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
                    value: s['progress'] as double,
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
          title: 'AI Explanation',
          text: 'Sleep quality and stress levels are currently the largest barriers preventing further improvements in health score. Improving average sleep by 45 minutes per night is projected to increase overall health score by approximately 6 points.',
        ),
      ],
    );
  }
}
