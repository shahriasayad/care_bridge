import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class AIAnalysisBox extends StatelessWidget {
  final String title;
  final String content;
  final List<String>? bulletPoints;
  final List<String>? tags;

  const AIAnalysisBox({
    super.key,
    required this.title,
    required this.content,
    this.bulletPoints,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F1ED),
        borderRadius: BorderRadius.circular(16),
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
                title,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF9F6E4D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: getTextStyle(
              fontSize: 14,
              // height: 1.5,
              color: AppColors.secondaryTextColor,
            ),
          ),
          if (bulletPoints != null && bulletPoints!.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...bulletPoints!.map(
              (bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ",
                      style: getTextStyle(
                        fontSize: 13,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bullet,
                        style: getTextStyle(
                          fontSize: 13,
                          // height: 1.4,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (tags != null && tags!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags!.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1D2C8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tag,
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
