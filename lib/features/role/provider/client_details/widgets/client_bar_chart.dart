import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/client_details/model/client_details_model.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/section_title.dart';

class ClientBarChart extends StatelessWidget {
  final BarChartDataModel data;

  const ClientBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: data.title),
        const SizedBox(height: 16),
        Container(
          height: 280,
          padding: const EdgeInsets.only(
            top: 24,
            right: 16,
            left: 0,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.scoreCardBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _buildLegendItem(
                      color: Colors.blueAccent,
                      text: "Actual",
                      isSquare: true,
                    ),
                    const SizedBox(width: 16),
                    _buildLegendItem(
                      color: Colors.purpleAccent,
                      text: "Target (1,700 kcal)",
                      isDashedLine: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 3000,
                    minY: 0,
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value.toInt() >= 0 &&
                                value.toInt() < data.data.length) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  data.data[value.toInt()].label,
                                  style: getTextStyle(
                                    fontSize: 10,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          reservedSize: 28,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) return _leftTitleText('0');
                            if (value == 1000) return _leftTitleText('1k');
                            if (value == 2000) return _leftTitleText('2k');
                            if (value == 2500) return _leftTitleText('2.5k');
                            return const SizedBox.shrink();
                          },
                          reservedSize: 32,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        HorizontalLine(
                          y: 1700,
                          color: Colors.purpleAccent.withValues(alpha: 0.5),
                          strokeWidth: 1.5,
                          dashArray: [4, 4],
                        ),
                      ],
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) => Colors.transparent,
                        tooltipPadding: EdgeInsets.zero,
                        tooltipMargin: 4,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            rod.toY.toInt().toString(),
                            getTextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryTextColor,
                            ),
                          );
                        },
                      ),
                    ),
                    barGroups: data.data.asMap().entries.map((entry) {
                      final index = entry.key;
                      final point = entry.value;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: point.value,
                            color: point.value >= 1700
                                ? const Color(0xFFFB923C)
                                : const Color(0xFF3B82F6),
                            width: 32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                        ],
                        showingTooltipIndicators: [0],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _leftTitleText(String text) {
    return Text(
      text,
      style: getTextStyle(fontSize: 10, color: AppColors.secondaryTextColor),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required String text,
    bool isSquare = false,
    bool isDashedLine = false,
  }) {
    return Row(
      children: [
        if (isSquare)
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          )
        else if (isDashedLine)
          Row(
            children: List.generate(
              4,
              (index) => Container(
                width: 3,
                height: 1.5,
                color: color,
                margin: const EdgeInsets.only(right: 2),
              ),
            ),
          )
        else
          Container(width: 8, height: 8, color: color),
        const SizedBox(width: 6),
        Text(
          text,
          style: getTextStyle(
            fontSize: 10,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
