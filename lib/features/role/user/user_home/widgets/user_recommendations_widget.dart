import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class AiRecommendationsWidget extends StatelessWidget {
  final List<Map<String, String>> recommendations;
  const AiRecommendationsWidget({super.key, required this.recommendations});

  Color _color(String level) {
    switch (level) {
      case 'high':
        return const Color(0xFF5A85A9); // Blue
      case 'medium':
        return AppColors.primaryButtonColor; // Orange/Brown
      case 'good':
        return AppColors.completedColor; // Green
      default:
        return AppColors.secondaryTextColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: recommendations
          .map(
            (r) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors
                    .scoreCardBackgroundColor, // Light beige background
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderColor, width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _color(r['level']!).withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            r['iconPath']!,
                            width: 16,
                            height: 16,
                            color: _color(r['level']!),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          r['text']!,
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    r['impact']!,
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: _color(r['level']!),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
