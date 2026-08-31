import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/health_score_widget.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';

class UserHealthScoreWidget extends StatelessWidget {
  final double score;
  final String label;

  const UserHealthScoreWidget({
    super.key,
    required this.score,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(ImagePath.healthBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Health Score',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 24),
          HealthScoreWidget(
            score: score * 100,
            message: label,
            size: 180,
            progressColor: AppColors.circularProgressIndicatorColor,
            backgroundColor: const Color(0xFFE1D2C8),
            isGauge: true,
          ),
        ],
      ),
    );
  }
}