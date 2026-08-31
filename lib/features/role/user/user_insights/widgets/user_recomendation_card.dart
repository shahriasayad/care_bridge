import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_insights/controller/user_insights_controller.dart';
import 'package:care_bridge/core/common/widgets/health_score_widget.dart';

class UserRecommendationCard extends StatelessWidget {
  final UserRecommendation rec;

  const UserRecommendationCard({super.key, required this.rec});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F4), // Light background color from Figma
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEADFD6)), // Subtle border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: rec.color.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Builder(
                  builder: (context) {
                    if (rec.icon is IconData) {
                      return Icon(rec.icon as IconData, color: rec.color, size: 16);
                    } else if (rec.icon is String) {
                      return Image.asset(
                        rec.icon as String,
                        width: 16,
                        height: 16,
                        color: rec.color,
                      );
                    } else if (rec.icon is Widget) {
                      return rec.icon as Widget;
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              const SizedBox(width: 12),
              Text(
                rec.type,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: rec.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF3C3530),
              ),
              children: [
                TextSpan(text: rec.message),
                if (rec.highlight.isNotEmpty)
                  TextSpan(
                    text: rec.highlight,
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: rec.color,
                    ),
                  ),
                if (rec.suffix.isNotEmpty) TextSpan(text: rec.suffix),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WellnessIntelligenceSection extends StatelessWidget {
  const WellnessIntelligenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Nutritions',
        'value': '80%',
        'status': 'Good',
        'color': const Color(0xFF4A5636), // Deep muted green
        'icon': IconPath.forkSpoon,
        'statusColor': const Color(0xFF4A5636),
      },
      {
        'title': 'Hydrations',
        'value': '80%',
        'status': 'Needs Work',
        'color': const Color(0xFF5C82A6), // Slate blue
        'icon': IconPath.waterIcon,
        'statusColor': const Color(
          0xFF9F6E4D,
        ), // Muted brown tone for "Needs Work"
      },
      {
        'title': 'Recovery',
        'value': '80%',
        'status': 'Good',
        'color': const Color(0xFF656698), // Muted purple/indigo
        'icon': IconPath.sleepIcon2,
        'statusColor': const Color(0xFF4A5636),
      },
      {
        'title': 'Consistency',
        'value': '80%',
        'status': 'Good',
        'color': const Color(0xFF9F6E4D), // Muted brown tone
        'icon': IconPath.consistencyIcon,
        'statusColor': const Color(0xFF4A5636),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wellness Intelligence',
          style: getTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF3C3530),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.96,
          ),
          itemBuilder: (_, i) {
            final item = items[i];
            final color = item['color'] as Color;

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF7F4),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEADFD6), width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HealthScoreWidget(
                    score: 80.0,
                    size: 72,
                    progressColor: color,
                    backgroundColor: const Color(0xFFEADFD6),
                    strokeWidth: 4.5,
                    isGauge: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 4),
                        Image.asset(
                          item['icon'] as String,
                          width: 20,
                          height: 20,
                          color: color,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['value'] as String,
                          style: getTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    item['title'] as String,
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF23140A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['status'] as String,
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: item['statusColor'] as Color,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
