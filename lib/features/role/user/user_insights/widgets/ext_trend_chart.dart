import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_painters.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

class SmoothLineTrendCard extends StatelessWidget {
  final String title;
  final String badgeText;
  final List<String> yAxisLabels;
  final List<String> xAxisLabels;

  const SmoothLineTrendCard({
    super.key,
    required this.title,
    required this.badgeText,
    required this.yAxisLabels,
    required this.xAxisLabels,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: _ChartTrendCard(
        title: title,
        badgeText: badgeText,
        yAxisLabels: yAxisLabels,
        xAxisLabels: xAxisLabels,
      ),
    );
  }
}

class _ChartTrendCard extends StatelessWidget {
  final String title;
  final String badgeText;
  final List<String> yAxisLabels;
  final List<String> xAxisLabels;

  const _ChartTrendCard({
    required this.title,
    required this.badgeText,
    required this.yAxisLabels,
    required this.xAxisLabels,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Y-axis labels
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: yAxisLabels.map((label) {
                    return Text(
                      label,
                      style: getTextStyle(
                        fontSize: 8,
                        color: const Color(0xFF675B54),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 8),
                // Chart area
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomPaint(
                          size: const Size(double.infinity, double.infinity),
                          painter: TrendLinePainter(
                            color: const Color(0xFF956246),
                            fillColor: const Color(0xFF956246).withOpacity(0.10),
                            badgeText: badgeText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // X-axis labels
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: xAxisLabels.map((label) {
                          return Text(
                            label,
                            style: getTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF675B54),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
