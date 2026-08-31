import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class ScoreProgressRow extends StatelessWidget {
  final String title;
  final int? score;
  final int maxScore;
  final bool isPercentage;
  final double? percentOverride;
  final String? scoreDisplayOverride;

  const ScoreProgressRow({
    super.key,
    required this.title,
    this.score,
    this.maxScore = 100,
    this.isPercentage = false,
    this.percentOverride,
    this.scoreDisplayOverride,
  });

  @override
  Widget build(BuildContext context) {
    final double percent = percentOverride ?? ((score ?? 0) / maxScore);
    final String scoreDisplay = scoreDisplayOverride ??
        (isPercentage ? "${score ?? 0}%" : "${score ?? 0}/$maxScore");

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FDF0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2F0D9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Text(
                scoreDisplay,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percent.clamp(0.0, 1.0),
              backgroundColor: const Color(0xFFE6DDD5),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF8F6343),
              ),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
