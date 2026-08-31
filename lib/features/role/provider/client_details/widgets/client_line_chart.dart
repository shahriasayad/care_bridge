import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/client_details/model/client_details_model.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/section_title.dart';

class ClientLineChart extends StatelessWidget {
  final LineChartDataModel data;

  const ClientLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.data.isEmpty) return const SizedBox.shrink();

    double maxY = (data.yAxisLabels.length - 1).toDouble();
    if (maxY <= 0) maxY = 1; // Fallback if empty

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: data.title),
        const SizedBox(height: 16),
        Container(
          height: 280,
          padding: const EdgeInsets.only(top: 32, right: 24, left: 0, bottom: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F0EB), 
            borderRadius: BorderRadius.circular(16),
          ),
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= 0 &&
                          value.toInt() < data.data.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
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
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 36,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < data.yAxisLabels.length) {
                        // The user provided the labels in order from bottom to top (0 is bottom).
                        // e.g. index 0 -> '0', index 1 -> '2.4k'
                        return Text(
                          data.yAxisLabels[index],
                          style: getTextStyle(
                            fontSize: 10,
                            color: AppColors.secondaryTextColor,
                          ),
                          textAlign: TextAlign.center,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    interval: 1, // ensure it ticks exactly at 0, 1, 2, ...
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: (data.data.length - 1).toDouble(),
              minY: 0,
              maxY: maxY,
              lineBarsData: [
                LineChartBarData(
                  spots: data.data.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value.value);
                  }).toList(),
                  isCurved: true,
                  color: const Color(0xFF9E7250),
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    checkToShowDot: (spot, barData) {
                      return spot.x == data.data.length - 1;
                    },
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 5,
                        color: const Color(0xFF9E7250),
                        strokeWidth: 0,
                      );
                    },
                  ),
                  belowBarData:  BarAreaData(
                    show: false,
                  ),
                ),
              ],
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) => const Color(0xFF9E7250),
                  tooltipPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  tooltipMargin: 8,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      if (spot.x == data.data.length - 1) {
                        return LineTooltipItem(
                          data.highestLabel,
                          getTextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                      return null;
                    }).toList();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
