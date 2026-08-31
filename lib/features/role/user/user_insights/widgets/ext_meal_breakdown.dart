import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_intake_card.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

class MealBreakdownWidget extends StatelessWidget {
  const MealBreakdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: NutritionSectionTitle('Meal Breakdown'),
        ),
        const SizedBox(height: 12),
        SoftCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(4, (index) {
              return MealItem(isLast: index == 3);
            }),
          ),
        ),
      ],
    );
  }
}

class MealItem extends StatelessWidget {
  final bool isLast;

  const MealItem({super.key, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Grilled Chicken Salad',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '420kcal – 32g protein',
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF66584F),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Ai Score: 9/10',
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeeklyMacroAveragesWidget extends StatelessWidget {
  const WeeklyMacroAveragesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Weekly Macro Averages'),
        const SizedBox(height: 14),
        SoftCard(
          color: const Color(0xFFF3F1EE),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          child: const Row(
            children: [
              Expanded(
                child: MacroGauge(
                  value: '1732',
                  label: 'kcal/day',
                  footer: '<32 kcal',
                  percent: 0.86,
                  color: Color(0xFF9AE06F),
                ),
              ),
              Expanded(
                child: MacroGauge(
                  value: '112g',
                  label: 'Protein',
                  footer: '93% goal',
                  percent: 0.80,
                ),
              ),
              Expanded(
                child: MacroGauge(
                  value: '165g',
                  label: 'Carbs',
                  footer: '93% goal',
                  percent: 0.72,
                  color: Color(0xFF6D6D6D),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Center(
          child: SizedBox(
            width: 235,
            child: SoftCard(
              color: const Color(0xFFF3F1EE),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: const Row(
                children: [
                  Expanded(
                    child: MacroGauge(
                      value: '61g',
                      label: 'Fat',
                      footer: '112% goal',
                      percent: 0.80,
                      color: Color(0xFF9AE06F),
                    ),
                  ),
                  Expanded(
                    child: MacroGauge(
                      value: '18g',
                      label: 'Fiber',
                      footer: '86% goal',
                      percent: 0.62,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
