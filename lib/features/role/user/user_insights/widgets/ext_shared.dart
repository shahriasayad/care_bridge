import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class NutritionSectionTitle extends StatelessWidget {
  final String title;
  const NutritionSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.tertiaryTextColor3,
      ),
    );
  }
}

class SoftCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? height;
  final Color color;

  const SoftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.height,
    this.color = const Color(0xFFF7F3F0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color valueColor;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    this.valueColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      height: 96,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: valueColor,
            ),
          ),
          Text(
            unit,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(fontSize: 12,fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class InsightProgressBar extends StatelessWidget {
  final double value; // 0.0 – 1.0
  const InsightProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: SizedBox(
        height: 4,
        child: LinearProgressIndicator(
          value: value.clamp(0.0, 1.0),
          backgroundColor: const Color(0xFFE8E0DB),
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF9A6A4B)),
        ),
      ),
    );
  }
}

class LegendSwatch extends StatelessWidget {
  final Color color;
  final String label;
  const LegendSwatch({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 7, height: 7, color: color),
        const SizedBox(width: 5),
        Text(label, style: getTextStyle(fontSize: 6,fontWeight: FontWeight.w400, color: AppColors.tertiaryTextColor3)),
      ],
    );
  }
}

// Shared AI Analysis Summary Card
class AiSummaryCard extends StatelessWidget {
  final String title;
  final String text;
  const AiSummaryCard({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEADFD6), width: 1),
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
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF9F6E4D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF675B54),
            ).copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}

// Shared 2-column Grid Metrics Card
class GridMetrics extends StatelessWidget {
  final List<Map<String, String>> metrics;
  const GridMetrics({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEADFD6), width: 1),
      ),
      child: Column(
        children: [
          _buildMetricRow(metrics[0], metrics[1]),
          const SizedBox(height: 18),
          _buildMetricRow(metrics[2], metrics[3]),
          const SizedBox(height: 18),
          _buildMetricRow(metrics[4], metrics[5]),
        ],
      ),
    );
  }

  Widget _buildMetricRow(Map<String, String> m1, Map<String, String> m2) {
    return Row(
      children: [
        Expanded(child: _buildSingleMetric(m1)),
        const SizedBox(width: 16),
        Expanded(child: _buildSingleMetric(m2)),
      ],
    );
  }

  Widget _buildSingleMetric(Map<String, String> m) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          m['title']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF675B54),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          m['value']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: getTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF23140A),
          ),
        ),
      ],
    );
  }
}
