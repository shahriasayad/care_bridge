import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_track/controller/user_track_meal_controller.dart';

class UserRecommendationsWidget extends StatelessWidget {
  const UserRecommendationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserTrackMealController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendations',
          style: getTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 12),
        ...controller.recommendations.asMap().entries.map(
          (entry) => _RecommendationItem(data: entry.value),
        ),
      ],
    );
  }
}

class _RecommendationItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const _RecommendationItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'] as String,
                      style: getTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${data['time']} · P:${data['protein']} · C:${data['carbs']} · F:${data['fat']}',
                      style: getTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${data['calories']}',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
        Divider(color: const Color(0xFFEDE8E4), height: 1, thickness: 1),
      ],
    );
  }
}
