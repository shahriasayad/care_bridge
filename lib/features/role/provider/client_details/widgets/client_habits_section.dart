import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/habit_circular_ring.dart';

class ClientHabitsSection extends StatelessWidget {
  final ClientDetailsController controller;

  const ClientHabitsSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHabitIntelligenceRings(),
        const SizedBox(height: 16),
        _buildNoLateNightSnacksProgress(),
      ],
    );
  }

  Widget _buildHabitIntelligenceRings() {
    final Map<String, Color> colors = {
      'red': const Color(0xFFD16B6B),
      'cyan': const Color(0xFF5BC0DE),
      'green': const Color(0xFF60B060),
      'blue': const Color(0xFF5A8BC6),
      'purple': const Color(0xFF9B6BC6),
    };

    final largeHabits = controller.habits.where((h) => h['large'] == true).toList();
    final smallHabits = controller.habits.where((h) => h['large'] == false).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF5F0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: largeHabits.map((item) {
              return HabitCircularRing(
                title: item['title'],
                percent: item['percent'],
                status: item['status'],
                progressColor: colors[item['color']] ?? Colors.green,
                isLarge: true,
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: smallHabits.map((item) {
              return HabitCircularRing(
                title: item['title'],
                percent: item['percent'],
                status: item['status'],
                progressColor: colors[item['color']] ?? Colors.green,
                isLarge: false,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNoLateNightSnacksProgress() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FDF0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2F0D9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "No Late Night Snacks",
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Text(
                "62%",
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 0.62,
              backgroundColor: Color(0xFFE6DDD5),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8F6343)),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
