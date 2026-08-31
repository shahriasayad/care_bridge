import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

class QuickInsightsWidget extends StatelessWidget {
  const QuickInsightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Quick Insights'),
        const SizedBox(height: 12),
        Row(
          children: [
            const Expanded(
              child: QuickInsightTile(
                icon: Icons.directions_walk_outlined,
                title: 'Steps',
                value: '6,820',
                subtitle: '70% of goal',
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: QuickInsightTile(
                icon: Icons.water_drop_outlined,
                title: 'Water Intake',
                value: '96 oz',
                subtitle: '100% of goal',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Expanded(
              child: QuickInsightTile(
                icon: Icons.local_cafe_outlined,
                title: 'Fasting Streak',
                value: '68%',
                subtitle: 'of average',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickInsightTile(
                icon: Image.asset(IconPath.highestSleep, height: 20, width: 20),
                title: 'Highest Hunger',
                value: '7:45M',
                subtitle: '8.5/10',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Individual tile used inside [QuickInsightsWidget].
class QuickInsightTile extends StatelessWidget {
  final dynamic icon;
  final String title;
  final String value;
  final String subtitle;

  const QuickInsightTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    if (icon is IconData) {
      iconWidget = Icon(icon as IconData, size: 19, color: const Color(0xFFB4774E));
    } else if (icon is String) {
      iconWidget = Image.asset(
        icon as String,
        width: 19,
        height: 19,
        color: const Color(0xFFB4774E),
      );
    } else if (icon is Widget) {
      iconWidget = icon as Widget;
    } else {
      iconWidget = const SizedBox.shrink();
    }

    return Container(
      height: 124,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FFEF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconWidget,
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF675B54),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(fontSize: 10, color: const Color(0xFF675B54)),
          ),
        ],
      ),
    );
  }
}

// 1. Cravings Trend Insight Banner Card
class CravingsTrendInsightCard extends StatelessWidget {
  const CravingsTrendInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6F0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF9D9C3), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFFDE3D2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.trending_down,
              color: Color(0xFFB4774E),
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cravings Insight',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF23140A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your sugar cravings dropped by 24% on days you hit your water intake goal.',
                  style: getTextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF675B54),
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

// 2. Quick Macro Progress Dashboard Card
class QuickMacroProgressCard extends StatelessWidget {
  const QuickMacroProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final macros = [
      {'name': 'Protein', 'value': '92g / 120g', 'pct': 0.76, 'color': const Color(0xFFD47C5E)},
      {'name': 'Carbs', 'value': '165g / 200g', 'pct': 0.82, 'color': const Color(0xFF5C82A6)},
      {'name': 'Fat', 'value': '61g / 70g', 'pct': 0.87, 'color': const Color(0xFF4A5636)},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEADFD6), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Macro Targets',
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF23140A),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: macros.map((m) {
              final color = m['color'] as Color;
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: CircularProgressIndicator(
                          value: m['pct'] as double,
                          strokeWidth: 4,
                          backgroundColor: color.withOpacity(0.12),
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                        ),
                      ),
                      Text(
                        '${((m['pct'] as double) * 100).toInt()}%',
                        style: getTextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF23140A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    m['name'] as String,
                    style: getTextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF23140A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    m['value'] as String,
                    style: getTextStyle(
                      fontSize: 8,
                      color: const Color(0xFF675B54),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// 3. Fasting Achievement Streak Card
class FastingStreakAchievementCard extends StatelessWidget {
  const FastingStreakAchievementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FFEF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD3ECD1), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFD4ECD2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.military_tech_outlined,
              color: Color(0xFF4A5636),
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fasting Achievement',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF23140A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'You matched your fasting streak goal 5 days in a row! Keep it up.',
                  style: getTextStyle(
                    fontSize: 11,
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
