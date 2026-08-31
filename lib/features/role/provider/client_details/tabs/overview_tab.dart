import 'package:flutter/material.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/ai_analysis_box.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/score_progress_row.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/section_title.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_metrics_section.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_stats_grid.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_symptoms_section.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_habits_section.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/client_compliance_section.dart';

class OverviewTab extends StatelessWidget {
  final ClientDetailsController controller;

  const OverviewTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClientMetricsSection(controller: controller),
        const SizedBox(height: 20),
        const AIAnalysisBox(
          title: "Grovr AI Executive Summary",
          content:
              "Over the past 30 days, Sarah has demonstrated strong consistency with food logging, hydration, and daily movement. Weight has decreased by 7 lbs while maintaining stable energy. Sleep quality has declined by 14%, coinciding with increased stress ratings and elevated late-night snacking.\n\n\"The strongest driver of positive outcomes remains high-protein breakfasts and consistent hydration.\"",
          tags: ["Sleep consistency", "Stress management", "Evening eating"],
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Whole Person Health Score"),
        ...controller.healthScores.map(
          (item) =>
              ScoreProgressRow(title: item['title'], score: item['score']),
        ),
        const SizedBox(height: 12),
        const AIAnalysisBox(
          title: "AI Explanation",
          content:
              "Sleep quality and stress levels are currently the largest barriers preventing further improvements in health score. Improving average sleep by 45 minutes per night is projected to increase overall health score by approximately 6 points",
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Mental Wellness"),
        ClientStatsGrid(stats: controller.mentalWellness),
        const SizedBox(height: 16),
        const AIAnalysisBox(
          title: "AI Mental Health Analysis",
          content:
              "Sarah reports elevated stress levels Monday through Wednesday. Mood scores tend to decline after poor sleep nights. Anxiety ratings increase on days with reduced physical activity. A positive relationship exists between exercise completion and emotional wellbeing. Provider Recommendation: Continue encouraging movement-based coping strategies and explore sleep-related stress triggers.",
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Activity & Fitness Analytics"),
        ClientStatsGrid(stats: controller.activityFitness),
        const SizedBox(height: 16),
        const AIAnalysisBox(
          title: "AI Fitness Analysis",
          content:
              "Cardiovascular fitness appears stable. Patient demonstrates highest adherence on weekdays. Workout completion drops 38% on weekends. Recovery metrics suggest adequate training load without evidence of overtraining. Suggested intervention: Introduce weekend accountability structure.",
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Sleep & Recovery Analytics"),
        ClientStatsGrid(stats: controller.sleepRecovery),
        const SizedBox(height: 16),
        const AIAnalysisBox(
          title: "AI Sleep Analysis",
          content:
              "Sleep duration has declined over the past 14 days. Reduced sleep correlates with:",
          bulletPoints: [
            "Increased calorie intake",
            "Higher stress ratings",
            "Lower workout completion",
            "Increased cravings",
          ],
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Nutrition & Intelligence"),
        ClientStatsGrid(stats: controller.nutrition),
        const SizedBox(height: 16),
        const AIAnalysisBox(
          title: "AI Nutrition Analysis",
          content:
              "Breakfast protein strongly predicts adherence later in the day. Weekend calorie intake averages 22% higher than weekdays. Fiber remains below target. Hydration is excellent.",
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Symptom Tracking"),
        ClientSymptomsSection(items: controller.symptoms, largeBottomRow: true),
        const SizedBox(height: 16),
        const AIAnalysisBox(
          title: "AI Symptom Analysis",
          content:
              "Reported fatigue increases significantly following nights with less than 6 hours of sleep. No dietary triggers have been consistently identified. Pattern suggests sleep-related fatigue rather than nutritional deficiency.",
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Habit Intelligence"),
        ClientHabitsSection(controller: controller),
        const SizedBox(height: 16),
        const AIAnalysisBox(
          title: "AI Habit Analysis",
          content:
              "The single highest-impact behavior appears to be breakfast protein intake. Patients days with >= 30g breakfast protein show:",
          bulletPoints: [
            "Better mood",
            "Fewer cravings",
            "Better adherence",
            "Lower calorie intake",
          ],
        ),
        const SizedBox(height: 28),
        const SectionTitle(title: "Medication & Treatment Compliance"),
        ClientComplianceSection(controller: controller),
        const SizedBox(height: 16),
        const AIAnalysisBox(
          title: "AI Compliance Analysis",
          content:
              "Patient demonstrates excellent adherence overall. Missed medication events occur most frequently during weekends.",
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
