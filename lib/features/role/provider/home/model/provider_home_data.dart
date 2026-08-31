import 'package:flutter/material.dart';

class DashboardSummaryCard {
  final String title;
  final String value;
  final String changeText;
  final bool isPositive;
  final List<double> sparklineData;
  final String iconurl;
  final Color themeColor;

  DashboardSummaryCard({
    required this.title,
    required this.value,
    required this.changeText,
    required this.isPositive,
    required this.sparklineData,
    required this.iconurl,
    required this.themeColor,
  });
}

class HealthOverviewSegment {
  final String label;
  final double percentage;
  final Color color;

  HealthOverviewSegment({
    required this.label,
    required this.percentage,
    required this.color,
  });
}

class HealthAreaItem {
  final String name;
  final double percentage;
  final bool isUpward;
  final IconData icon;
  final Color iconColor;

  HealthAreaItem({
    required this.name,
    required this.percentage,
    required this.isUpward,
    required this.icon,
    required this.iconColor,
  });
}

class EngagementCard {
  final String title;
  final String value;
  final String changeText;
  final bool isPositive;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  EngagementCard({
    required this.title,
    required this.value,
    required this.changeText,
    required this.isPositive,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });
}

class ProviderDashboardData {
  final String greetingName;
  final String earningsValue;
  final String earningsChange;
  final List<double> earningsSparkline;
  final List<DashboardSummaryCard> summaryCards;
  final double overallHealthScore;
  final String healthScoreText;
  final List<HealthOverviewSegment> healthSegments;
  final List<HealthAreaItem> healthAreas;
  final List<EngagementCard> engagementCards;

  ProviderDashboardData({
    required this.greetingName,
    required this.earningsValue,
    required this.earningsChange,
    required this.earningsSparkline,
    required this.summaryCards,
    required this.overallHealthScore,
    required this.healthScoreText,
    required this.healthSegments,
    required this.healthAreas,
    required this.engagementCards,
  });
}
