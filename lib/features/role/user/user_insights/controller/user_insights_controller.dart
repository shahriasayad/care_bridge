import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_insights/model/user_insight_daydata_model.dart';

class UserInsightsController extends GetxController {
  final selectedPeriod = 'Weekly'.obs;
  final periods = ['Weekly', 'Monthly'];
  final selectedTab = 'Nutrition'.obs;

  // Weekly historical tracking data for charts
  final weeklyData = <UserInsightDayDataModel>[
    UserInsightDayDataModel(
      day: 'M',
      grovrScore: 68,
      sleepHours: 5.5,
      cravingLevel: 4,
    ),
    UserInsightDayDataModel(
      day: 'T',
      grovrScore: 74,
      sleepHours: 7.0,
      cravingLevel: 2,
    ),
    UserInsightDayDataModel(
      day: 'W',
      grovrScore: 70,
      sleepHours: 5.0,
      cravingLevel: 4.5,
    ),
    UserInsightDayDataModel(
      day: 'T',
      grovrScore: 75,
      sleepHours: 8.0,
      cravingLevel: 1.5,
    ),
    UserInsightDayDataModel(
      day: 'F',
      grovrScore: 72,
      sleepHours: 6.5,
      cravingLevel: 3,
    ),
    UserInsightDayDataModel(
      day: 'S',
      grovrScore: 78,
      sleepHours: 7.5,
      cravingLevel: 2,
    ),
    UserInsightDayDataModel(
      day: 'S',
      grovrScore: 71,
      sleepHours: 6.0,
      cravingLevel: 3.5,
    ),
  ].obs;

  // Figma Wellness Intelligence Section Dataset
  final intelligenceMetrics = <Map<String, dynamic>>[
    {
      'title': 'Nutritions',
      'value': '80%',
      'status': 'Good',
      'color': const Color(0xFF4A5636),
      'icon': IconPath.forkSpoon,
      'statusColor': const Color(0xFF4A5636),
    },
    {
      'title': 'Hydrations',
      'value': '80%',
      'status': 'Needs Work',
      'color': const Color(0xFF5C82A6),
      'icon': IconPath.waterIcon,
      'statusColor': const Color(0xFF9F6E4D),
    },
    {
      'title': 'Recovery',
      'value': '80%',
      'status': 'Good',
      'color': const Color(0xFF7C82B8),
      'icon': IconPath.sleepIcon2,
      'statusColor': const Color(0xFF4A5636),
    },
    {
      'title': 'Consistency',
      'value': '80%',
      'status': 'Good',
      'color': const Color(0xFF9F6E4D),
      'icon': IconPath.consistencyIcon,
      'statusColor': const Color(0xFF4A5636),
    },
  ].obs;

  double get avgGrovrScore {
    if (weeklyData.isEmpty) return 0;
    return weeklyData.map((d) => d.grovrScore).reduce((a, b) => a + b) /
        weeklyData.length;
  }

  int get avgGrovrScoreInt => avgGrovrScore.round();

  final vsDelta = '+8'.obs;

  final insightTitle = 'Low sleep → higher cravings'.obs;
  final insightDescription =
      'On nights you slept under 6h, your cravings the next day jumped +38%, and refined-carb meals doubled.'
          .obs;

  final recommendations = <UserRecommendation>[
    UserRecommendation(
      type: 'Ai Insights',
      message: 'Your protein intake improved ',
      highlight: '18% this week',
      icon: Icons.auto_awesome_outlined,
      color: const Color(0xFF556643), // Greenish
    ),
    UserRecommendation(
      type: 'Recovery Insights',
      message: 'Late-night eating may be lowering your sleep',
      highlight: '',
      icon: IconPath.sleepIcon2,
      color: const Color(0xFF656698), // Indigo/Purple
    ),
    UserRecommendation(
      type: 'Hydration',
      message: 'You\'re averaging ',
      highlight: '30%',
      suffix: ' below your hydration goal.',
      icon: IconPath.waterIcon,
      color: const Color(0xFF9F6E4D), // Brown/Orange
    ),
    UserRecommendation(
      type: 'Lifestyle Insight',
      message: 'Great job! You hit your movement goal ',
      highlight: '4 days',
      suffix: ' this week',
      icon: Icons.eco_outlined,
      color: const Color(0xFF556643), // Greenish
    ),
  ].obs;

  final insightsProgress = <Map<String, dynamic>>[
    {
      'iconPath': IconPath.stepsIcon,
      'title': 'Steps',
      'value': '6,820',
      'goal': 'Goal: 8000',
      'progress': 6820 / 8000.0,
      'color': const Color(0xFF9F6E4D),
    },
    {
      'iconPath': IconPath.caloriesIcon,
      'title': 'Calories',
      'value': '1,650',
      'goal': 'Goal: 1800',
      'progress': 1650 / 1800.0,
      'color': const Color(0xFF9F6E4D),
    },
    {
      'iconPath': IconPath.waterIcon,
      'title': 'Water Intake',
      'value': '1.2L',
      'goal': 'Goal: 2.0L',
      'progress': 1.2 / 2.0,
      'color': const Color(0xFF9F6E4D),
    },
    {
      'iconPath': IconPath.sleepIcon,
      'title': 'Sleep',
      'value': '7h 12m',
      'goal': 'Goal: 8h',
      'progress': 7.2 / 8.0,
      'color': const Color(0xFF9F6E4D),
    },
  ].obs;

  final insightsMetrics = <Map<String, dynamic>>[
    {
      'iconPath': 'assets/icons/weight.png',
      'title': 'Weight',
      'delta': '1.2 lbs',
      'vs': 'vs last week',
      'isPositive': true,
      'color': const Color(0xFF4CB17D),
    },
    {
      'iconPath': IconPath.caloriesIcon,
      'title': 'Calories',
      'delta': '120 kcal',
      'vs': 'vs last week',
      'isPositive': true,
      'color': const Color(0xFF4CB17D),
    },
    {
      'iconPath': IconPath.sleepIcon,
      'title': 'Sleep',
      'delta': '40 min',
      'vs': 'vs last week',
      'isPositive': true,
      'color': const Color(0xFF4CB17D),
    },
    {
      'iconPath': IconPath.stepsIcon,
      'title': 'Steps',
      'delta': '1280',
      'vs': 'vs last week',
      'isPositive': true,
      'color': const Color(0xFF4CB17D),
    },
  ].obs;
}

class UserRecommendation {
  final String type;
  final String message;
  final String highlight;
  final String suffix;
  final dynamic icon;
  final Color color;

  UserRecommendation({
    required this.type,
    required this.message,
    this.highlight = '',
    this.suffix = '',
    required this.icon,
    required this.color,
  });
}
