import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class ClientStatsGrid extends StatelessWidget {
  final Map<String, String> stats;

  const ClientStatsGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F1ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 12,
          childAspectRatio: 2.8,
        ),
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final String key = stats.keys.elementAt(index);
          final String val = stats.values.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                key,
                style: getTextStyle(
                  fontSize: 12,
                  color: AppColors.secondaryTextColor.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                val,
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
