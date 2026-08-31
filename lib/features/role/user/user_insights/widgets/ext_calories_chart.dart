import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

class CaloriesBarChartCard extends StatelessWidget {
  const CaloriesBarChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Values perfectly matching the Figma screenshot
    final calories = [1650, 1710, 1680, 1730, 1720, 2050, 1570];
    const targetValue = 1700;
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    // Y-axis labels for the chart
    final yLabels = ['2.5k', '2k', '1k', '0'];
    final yMax = 2500.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title outside the card, perfectly left-aligned with the card
        const NutritionSectionTitle('Daily Calories vs Target'),
        const SizedBox(height: 12),
        SoftCard(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Legend
              Row(
                children: [
                  LegendSwatch(
                    color: const Color(0xFF3F8DF5),
                    label: 'Actual',
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 14,
                        child: Text(
                          '- - - -',
                          style: getTextStyle(
                            color: const Color(0xFFC48BFF),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Target (1,700 kcal)',
                        style: getTextStyle(fontSize: 8, color: const Color(0xFF675B54)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Chart Area
              SizedBox(
                height: 180,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Y-axis labels
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: yLabels.map((label) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: label == '2.5k' ? 16.0 : 0.0,
                            bottom: label == '0' ? 16.0 : 0.0,
                          ),
                          child: Text(
                            label,
                            style: getTextStyle(
                              fontSize: 8,
                              color: const Color(0xFF675B54),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 12),
                    // Chart bars and lines
                    Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Dashed target line
                          Positioned(
                            bottom: (targetValue / yMax) * 148 + 16, // Matching the Y-axis ratio
                            left: 0,
                            right: 0,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    (constraints.maxWidth / 6).floor(),
                                    (index) => Container(
                                      width: 3,
                                      height: 1,
                                      color: const Color(0xFFC48BFF),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Bars and X-axis
                          Column(
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(days.length, (index) {
                                    final value = calories[index];
                                    final isOverTarget = value > targetValue;
                                    
                                    return Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            // Value label on top of bar
                                            Text(
                                              '${value.toString().replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',')}',
                                              style: getTextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFF363B40),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            // Bar
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.bottomCenter,
                                                child: FractionallySizedBox(
                                                  heightFactor: (value / yMax).clamp(0.0, 1.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: isOverTarget
                                                          ? const Color(0xFFFF943C)
                                                          : const Color(0xFF3F8DF5),
                                                      borderRadius: const BorderRadius.vertical(
                                                        top: Radius.circular(4),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // X-axis labels
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: days.map((day) {
                                  return Expanded(
                                    child: Text(
                                      day,
                                      textAlign: TextAlign.center,
                                      style: getTextStyle(
                                        fontSize: 8,
                                        color: const Color(0xFF675B54),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
