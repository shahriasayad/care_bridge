import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/semi_circle_gauge.dart';

class ClientSymptomsSection extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Color? backgroundColor;
  final Color? bottomRowBgColor;
  final bool largeBottomRow;

  const ClientSymptomsSection({
    super.key,
    required this.items,
    this.backgroundColor,
    this.bottomRowBgColor,
    this.largeBottomRow = false,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> colors = {
      'orange': const Color(0xFFD76C62),
      'purple': const Color(0xFFCE58EB),
      'blue': const Color(0xFF627DD7),
      'brown': const Color(0xFFD7AA62),
      'green': const Color(0xFF62D797),
    };

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.scoreCardBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.take(3).map((item) {
              return Expanded(
                child: SemiCircleGauge(
                  title: item['title'] ?? '',
                  value: item['value'] ?? '',
                  percent: (item['percent'] as num?)?.toDouble() ?? 0.0,
                  progressColor: item['progressColor'] is Color
                      ? item['progressColor'] as Color
                      : (colors[item['color']] ?? Colors.orange),
                  gaugeWidth: 90,
                  gaugeHeight: 50,
                  fontSizeMultiplier: 1.0,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Container(
            padding: bottomRowBgColor != null
                ? const EdgeInsets.symmetric(vertical: 12)
                : EdgeInsets.zero,
            decoration: bottomRowBgColor != null
                ? BoxDecoration(
                    color: bottomRowBgColor,
                    borderRadius: BorderRadius.circular(8),
                  )
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: items.skip(3).map((item) {
                return Expanded(
                  child: SemiCircleGauge(
                    title: item['title'] ?? '',
                    value: item['value'] ?? '',
                    percent: (item['percent'] as num?)?.toDouble() ?? 0.0,
                    progressColor: item['progressColor'] is Color
                        ? item['progressColor'] as Color
                        : (colors[item['color']] ?? Colors.orange),
                    gaugeWidth: largeBottomRow ? 135 : 90,
                    gaugeHeight: largeBottomRow ? 77 : 50,
                    fontSizeMultiplier: largeBottomRow ? 1.3 : 1.0,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
