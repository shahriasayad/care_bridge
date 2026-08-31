import 'package:flutter/material.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

// 3. Mental Wellness Widget
class MentalWellnessSection extends StatelessWidget {
  const MentalWellnessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {'title': 'Mood Average', 'value': '7.8 / 10'},
      {'title': 'Stress Level', 'value': '6.4 / 10'},
      {'title': 'Anxiety Rating', 'value': '4.2 / 10'},
      {'title': 'Energy Rating', 'value': '7.1 / 10'},
      {'title': 'Motivation Score', 'value': '4.2 / 10'},
      {'title': 'Burnout Risk', 'value': 'Low'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Mental Wellness'),
        const SizedBox(height: 16),
        GridMetrics(metrics: metrics),
        const SizedBox(height: 16),
        const AiSummaryCard(
          title: 'AI Mental Health Analysis',
          text: 'Sarah reports elevated stress levels Monday through Wednesday. Mood scores tend to decline after poor sleep nights. Anxiety ratings increase on days with reduced physical activity. A positive relationship exists between exercise completion and emotional wellbeing. Provider Recommendation: Continue encouraging movement-based coping strategies and explore sleep-related stress triggers.',
        ),
      ],
    );
  }
}

// 4. Activity & Fitness Analytics Widget
class ActivityFitnessAnalyticsSection extends StatelessWidget {
  const ActivityFitnessAnalyticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {'title': 'Average Steps', 'value': '8,312/day'},
      {'title': 'Exercise Sessions', 'value': '3.4/week'},
      {'title': 'Active Minutes', 'value': '267/week'},
      {'title': 'Calories Burned', 'value': '2,415/week'},
      {'title': 'Resting Heart Rate', 'value': '63 bpm'},
      {'title': 'Heart Rate Variability', 'value': '42 ms'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Activity & Fitness Analytics'),
        const SizedBox(height: 16),
        GridMetrics(metrics: metrics),
        const SizedBox(height: 16),
        const AiSummaryCard(
          title: 'AI Fitness Analysis',
          text: 'Cardiovascular fitness appears stable. Patient demonstrates highest adherence on weekdays. Workout completion drops 38% on weekends. Recovery metrics suggest adequate training load without evidence of overtraining. Suggested intervention: Introduce weekend accountability structure.',
        ),
      ],
    );
  }
}

// 5. Sleep & Recovery Analytics Widget
class SleepRecoveryAnalyticsSection extends StatelessWidget {
  const SleepRecoveryAnalyticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {'title': 'Average Sleep', 'value': '6h 23m'},
      {'title': 'Goal', 'value': '8h'},
      {'title': 'Sleep Consistency', 'value': '68%'},
      {'title': 'Sleep Quality', 'value': '72%'},
      {'title': 'Wake Events', 'value': '2.1/night'},
      {'title': 'Recovery Score', 'value': '81/100'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NutritionSectionTitle('Sleep & Recovery Analytics'),
        const SizedBox(height: 16),
        GridMetrics(metrics: metrics),
        const SizedBox(height: 16),
        const AiSummaryCard(
          title: 'AI Sleep Analysis',
          text: 'Sleep duration has declined over the past 14 days. Reduced sleep correlates with:\n\n• Increased calorie intake\n• Higher stress ratings\n• Lower workout completion\n• Increased cravings\n\nSleep appears to be a primary driver of current health limitations.',
        ),
      ],
    );
  }
}
