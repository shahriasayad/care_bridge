import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/user/user_home/controller/user_home_controller.dart';
import 'package:care_bridge/features/role/user/user_home/widgets/user_care_team_widget.dart';
import 'package:care_bridge/features/role/user/user_home/widgets/user_health_score_widget.dart';
import 'package:care_bridge/features/role/user/user_home/widgets/user_recommendations_widget.dart';
import 'package:care_bridge/features/role/user/user_home/widgets/user_todays_progress_widget.dart';
import 'package:care_bridge/features/role/user/user_home/widgets/user_wellness_widget.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  final UserHomeController controller = Get.put(UserHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 78, left: 16, right: 16, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Row(
                children: [
                  Image.asset(ImagePath.singleLogo, width: 43, height: 48),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.notificationsScreen),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: AppColors.iconBackground, shape: BoxShape.circle),
                      child: Icon(Icons.notifications_outlined, color: AppColors.iconColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              Text('Good Morning,\nKayla 🔸',
                  style: getTextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.primaryTextColor)),
              const SizedBox(height: 16),
              Text('Small choices, big changes. Let\'s make today your healthiest one yet.',
                  style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.secondaryTextColor)),
              const SizedBox(height: 24),

              UserHealthScoreWidget(score: controller.healthScore, label: controller.healthScoreLabel),
              const SizedBox(height: 32),

              _header('Wellness Intelligence', 'View Trends', () => Get.toNamed(AppRoutes.userInsightsScreen)),
              const SizedBox(height: 16),
              WellnessIntelligenceWidget(data: controller.wellnessData),
              const SizedBox(height: 32),

              _header("Today's Progress", 'View Details', () => Get.toNamed(AppRoutes.userInsightsScreen)),
              const SizedBox(height: 16),
              TodaysProgressWidget(data: controller.progressData),
              const SizedBox(height: 32),

              _header('Your Care Team', 'See All', () {}),
              const SizedBox(height: 16),
              CareTeamWidget(careTeam: controller.careTeam),
              const SizedBox(height: 32),

              _header("Today's AI Recommendations", 'See All', () {}),
              const SizedBox(height: 16),
              AiRecommendationsWidget(recommendations: controller.aiRecommendations),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(String title, String action, VoidCallback onTap) => Row(
    children: [
      Text(title, style: getTextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.primaryTextColor)),
      const Spacer(),
      GestureDetector(
        onTap: onTap,
        child: Text(action, style: getTextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primaryButtonColor)),
      ),
    ],
    
  );
}