import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/home/model/provider_home_data.dart';

class TopHealthAreasCard extends StatelessWidget {
  final ProviderDashboardData data;

  const TopHealthAreasCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.healthAreas.length,
        separatorBuilder: (context, index) =>
            const Divider(color: AppColors.borderColor, height: 1),
        itemBuilder: (context, index) {
          final area = data.healthAreas[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: area.iconColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(area.icon, size: 20, color: area.iconColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    area.name,
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ),
                Text(
                  '${area.percentage.toInt()}%',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  area.isUpward ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 16,
                  color: area.isUpward
                      ? AppColors.textWithgreen
                      : AppColors.cancelledColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
