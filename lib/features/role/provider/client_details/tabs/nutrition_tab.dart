import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/nutrition_components.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_bar_chart.dart';

class NutritionTab extends GetView<ClientDetailsController> {
  const NutritionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final data = controller.nutritionTabData;

      if (data == null) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: CircularProgressIndicator(color: AppColors.iconColor),
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Actual Intake Gauge
            ActualIntakeGauge(
              intake: data.actualIntake,
              target: data.dailyTarget,
            ),
            const SizedBox(height: 24),

            // 2. Target & Difference Cards
            TargetDifferenceRow(
              target: data.dailyTarget,
              difference: data.actualIntake - data.dailyTarget,
            ),
            const SizedBox(height: 24),

            Text(
              'Macros',
              style: getTextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...data.macros
                .map(
                  (macro) => NutritionProgressCard(
                    title: macro.title,
                    middleText: macro.valueText,
                    rightText: macro.scoreText,
                    percent: macro.percent,
                  ),
                )
                .toList(),
            const SizedBox(height: 24),

            Text(
              'Quick Insights',
              style: getTextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            QuickInsightsGrid(insights: data.quickInsights),
            const SizedBox(height: 24),

            // // 5. Daily Calories vs Target (Bar chart)
            // const Text(
            //   'Daily Calories vs Target',
            //   style: TextStyle(
            //     color: AppColors.primaryTextColor,
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(height: 16),
            if (controller.dailyCaloriesBarChart != null)
              ClientBarChart(data: controller.dailyCaloriesBarChart!),
            const SizedBox(height: 24),

            Text(
              'Key Metrics',
              style: getTextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            KeyMetricsList(metrics: data.keyMetrics),
            const SizedBox(height: 24),

            Text(
              'Meal Breakdown',
              style: getTextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            MealList(meals: data.meals),
            const SizedBox(height: 24),

            // 8. Weekly Macro Averages
            Text(
              'Weekly Macro Averages',
              style: getTextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            WeeklyMacroAveragesSection(averages: data.weeklyAverages),
            const SizedBox(height: 32),

            // 9. Bottom Action Buttons
            const NutritionActionButtons(),
            const SizedBox(height: 24),
          ],
        ),
      );
    });
  }
}
