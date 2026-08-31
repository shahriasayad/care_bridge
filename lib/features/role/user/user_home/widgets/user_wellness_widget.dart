import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/health_score_widget.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class WellnessIntelligenceWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const WellnessIntelligenceWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (_, i) {
        final item = data[i];
        final bool ok = item['statusOk'] as bool;
        final Color progressColor =
            item['progressColor'] as Color? ?? AppColors.nutritionProgress;
        final Color backgroundColor =
            item['backgroundColor'] as Color? ?? AppColors.nutritionProgressEnd;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.scoreCardBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthScoreWidget(
                score: (item['value'] as double) * 100,
                size: 76,
                strokeWidth: 5,
                progressColor: progressColor,
                backgroundColor: backgroundColor,
                isGauge: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      item['iconPath'] as String,
                      width: 20,
                      height: 20,
                      color: progressColor,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['percent'] as String,
                      style: getTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: progressColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item['title'] as String,
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item['status'] as String,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ok ? const Color(0xFF556643) : const Color(0xFF9F6E4D),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
