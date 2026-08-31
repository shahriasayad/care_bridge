import 'dart:ui';

import 'package:get/get.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/core/const/image_path.dart';

class UserHomeController extends GetxController {
  final double healthScore = 0.80;
  final String healthScoreLabel = 'Great Job!';

  final List<Map<String, dynamic>> wellnessData = [
    {
      'iconPath': IconPath.nutritionIcon,
      'title': 'Nutrition',
      'value': 0.80,
      'percent': '80%',
      'status': 'Good',
      'statusOk': true,
      'progressColor': const Color(0xFF556643),
      'backgroundColor': const Color(0xFFE2D5CB),
    },
    {
      'iconPath': IconPath.waterIcon,
      'title': 'Hydration',
      'value': 0.80,
      'percent': '80%',
      'status': 'Needs Work',
      'statusOk': false,
      'progressColor': Color(0xFF5C82A6),
      'backgroundColor': Color(0xFFE2D5CB),
    },
    {
      'iconPath': IconPath.sleepIcon2,
      'title': 'Recovery',
      'value': 0.80,
      'percent': '80%',
      'status': 'Good',
      'statusOk': true,
      'progressColor': Color(0xFF7C82B8),
      'backgroundColor': Color(0xFFE2D5CB),
    },
    {
      'iconPath': IconPath.consistencyIcon,
      'title': 'Consistency',
      'value': 0.80,
      'percent': '80%',
      'status': 'Good',
      'statusOk': true,
      'progressColor': Color(0xFF9F6E4D),
      'backgroundColor': Color(0xFFE2D5CB),
    },
  ];

  final List<Map<String, dynamic>> progressData = [
    {
      'iconPath': IconPath.nutritionIcon,
      'title': 'Nutrition',
      'value': '78%',
      'goal': 'Goal: 80%',
      'progress': 0.78,
    },
    {
      'iconPath': IconPath.waterIcon,
      'title': 'Hydration',
      'value': '1.2L',
      'goal': 'Goal: 2.0L',
      'progress': 0.60,
    },
    {
      'iconPath': IconPath.sleepIcon,
      'title': 'Sleep',
      'value': '7h 12m',
      'goal': 'Goal: 8h',
      'progress': 0.90,
    },
    {
      'iconPath': IconPath.energyIcon,
      'title': 'Energy',
      'value': '1/5',
      'goal': 'Low',
      'progress': 0.20,
    },
    {
      'iconPath': IconPath.recoveryIcon,
      'title': 'Recovery',
      'value': '3/5',
      'goal': 'Fair',
      'progress': 0.60,
    },
    {
      'iconPath': IconPath.moodIcon,
      'title': 'Mood Stability',
      'value': 'Balanced',
      'goal': 'Good',
      'progress': 0.80,
    },
    {
      'iconPath': IconPath.stepsIcon,
      'title': 'Steps',
      'value': '6,820',
      'goal': 'Goal: 8000',
      'progress': 0.85,
    },
    {
      'iconPath': IconPath.consistencyIcon,
      'title': 'Consistency',
      'value': '4/7',
      'goal': 'Days this week',
      'progress': 0.57,
    },
  ];

  final List<Map<String, String>> careTeam = [
    {
      'name': 'Dr. Sarah Chen',
      'role': 'Nutritionist',
      'availability': 'Tomorrow , 10:00 AM',
      'imagePath': ImagePath.profile7,
    },
    {
      'name': 'Dr. Sarah',
      'role': 'Nutritionist',
      'availability': 'Tomorrow , 10:00 AM',
      'imagePath': ImagePath.profile7,
    },
  ];

  final List<Map<String, String>> aiRecommendations = [
    {
      'iconPath': IconPath.forkSpoon,
      'text': 'Increase protein at breakfast',
      'impact': 'High Impact',
      'level': 'high',
    },
    {
      'iconPath': IconPath.timeIcon,
      'text': 'Try to eat earlier tonight',
      'impact': 'Medium Impact',
      'level': 'medium',
    },
    {
      'iconPath': IconPath.waterIcon,
      'text': 'Hydration is lower than normal',
      'impact': 'High Impact',
      'level': 'high',
    },
    {
      'iconPath': IconPath.sleepIcon2,
      'text': 'Your sleep consistency improved',
      'impact': 'Great Job!',
      'level': 'good',
    },
  ];
}
