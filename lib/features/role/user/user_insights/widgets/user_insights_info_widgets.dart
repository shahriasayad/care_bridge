import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/controller/user_insights_controller.dart';

class SleepCravingsCard extends StatelessWidget {
  final UserInsightsController c;
  const SleepCravingsCard({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final data = c.weeklyData;
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.scoreCardBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              c.insightTitle.value,
              style: getTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              c.insightDescription.value,
              style: getTextStyle(
                fontSize: 12,
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            _Legend(),
            const SizedBox(height: 12),
            SizedBox(
              height: 110,
              child: BarChart(
                BarChartData(
                  maxY: 10,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (v, _) => Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            data[v.toInt()].day,
                            style: getTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  barGroups: List.generate(data.length, (i) {
                    return BarChartGroupData(
                      x: i,
                      barsSpace: 3,
                      barRods: [
                        BarChartRodData(
                          toY: data[i].sleepHours,
                          color: AppColors.primaryGraphColor,
                          width: 14,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                        ),
                        BarChartRodData(
                          toY: data[i].cravingLevel,
                          color: AppColors.secondaryGraphColor,
                          width: 14,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Dot(color: AppColors.primaryGraphColor),
        const SizedBox(width: 4),
        Text(
          'Sleep (h)',
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
        ),
        const Spacer(),
        _Dot(color: AppColors.secondaryGraphColor),
        const SizedBox(width: 4),
        Text(
          'Cravings (1-5)',
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryGraphColor.withOpacity(0.3),
        ),
      ),
    );
  }
}
