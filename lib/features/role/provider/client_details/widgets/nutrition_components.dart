import 'dart:math';
import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/provider/client_details/model/client_details_model.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/metric_progress_card.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/score_progress_row.dart';

// --- ACTUAL INTAKE GAUGE ---
class ActualIntakeGauge extends StatelessWidget {
  final int intake;
  final int target;

  const ActualIntakeGauge({
    super.key,
    required this.intake,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F1ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Actual Intake',
            style: getTextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: 160,
                height: 80,
                child: CustomPaint(
                  painter: _LargeSemiCircleGaugePainter(
                    percent: target > 0 ? intake / target : 0,
                    color: const Color(0xFFD7AA62), // Orange
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$intake',
                    style: getTextStyle(
                      color: const Color(0xFF4A2B1D),
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'kcal',
                    style: getTextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10), // Padding from bottom of gauge
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LargeSemiCircleGaugePainter extends CustomPainter {
  final double percent;
  final Color color;

  _LargeSemiCircleGaugePainter({required this.percent, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final center = Offset(width / 2, height);
    final radius = width / 2 - 4;
    final Paint trackPaint = Paint()
      ..color = const Color(0xFFE6DDD5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14159265359,
      3.14159265359,
      false,
      trackPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14159265359,
      3.14159265359 * percent.clamp(0.0, 1.0),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// --- TARGET CARDS ---
class TargetDifferenceRow extends StatelessWidget {
  final int target;
  final int difference;

  const TargetDifferenceRow({
    super.key,
    required this.target,
    required this.difference,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCard('Daily Target', '$target', const Color(0xFF4A2B1D)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildCard(
            'Difference',
            '${difference > 0 ? '+' : ''}$difference',
            AppColors.iconColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String title, String value, Color valueColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.scoreCardBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getTextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: getTextStyle(
              color: valueColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Kcal',
            style: getTextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// --- NUTRITION PROGRESS CARD ---
class NutritionProgressCard extends StatelessWidget {
  final String title;
  final String? middleText;
  final String rightText;
  final double percent;

  const NutritionProgressCard({
    super.key,
    required this.title,
    this.middleText,
    required this.rightText,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: getTextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: middleText != null
                    ? Text(
                        middleText!,
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  rightText,
                  textAlign: TextAlign.right,
                  style: getTextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: percent.clamp(0.0, 1.0),
                backgroundColor: const Color(0xFFD6D4CD),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primaryGraphColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- QUICK INSIGHTS ---
class QuickInsightsGrid extends StatelessWidget {
  final List<QuickInsightModel> insights;

  const QuickInsightsGrid({super.key, required this.insights});

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < insights.length; i += 2) {
      final hasNext = i + 1 < insights.length;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildCard(insights[i])),
              const SizedBox(width: 16),
              Expanded(
                child: hasNext
                    ? _buildCard(insights[i + 1])
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
      if (i + 2 < insights.length) {
        rows.add(const SizedBox(height: 16));
      }
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }

  Widget _buildCard(QuickInsightModel insight) {
    final source = _getIconSource(insight.iconType);
    return MetricProgressCard(
      title: insight.title,
      value: insight.value,
      goalText: insight.subtitle,
      assetPath: source is String ? source : null,
      icon: source is IconData ? source : null,
      percent: null,
    );
  }

  dynamic _getIconSource(String type) {
    switch (type.toLowerCase()) {
      case 'steps':
        return IconPath.stepsIcon;
      case 'water':
        return IconPath.waterIcon;
      case 'snack':
        return IconPath.coffeeCupIcon;
      case 'hunger':
        return IconPath.sleepIcon;
      case 'streak':
        return Icons.local_fire_department_outlined;
      case 'hrv':
        return Icons.favorite_border;
      default:
        return Icons.insights;
    }
  }
}

// --- KEY METRICS PROGRESS ---
class KeyMetricsList extends StatelessWidget {
  final List<NutritionKeyMetricModel> metrics;

  const KeyMetricsList({Key? key, required this.metrics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return ScoreProgressRow(
          title: metric.title,
          percentOverride: metric.percent,
          scoreDisplayOverride: metric.rightText,
        );
      },
    );
  }
}

// --- MEAL LIST ---
class MealList extends StatelessWidget {
  final List<MealModel> meals;

  const MealList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.scoreCardBackgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: meals
            .map(
              (meal) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        ImagePath.food,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey[300],
                          child: const Icon(Icons.fastfood, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.title,
                            style: getTextStyle(
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            meal.stats,
                            style: getTextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            meal.scoreText,
                            style: getTextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// --- ACTION BUTTONS ---

class NutritionActionButtons extends StatelessWidget {
  const NutritionActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(text: 'Message', onTap: () {}),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(text: 'Complete', onTap: () {}),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                backgroundColor: const Color(0xFFFAF1EC),
                text: 'Cancel',
                textColor: AppColors.primaryButtonColor,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(text: 'Download Report', onTap: () {}),
            ),
          ],
        ),
      ],
    );
  }
}

// --- WEEKLY MACRO AVERAGES SECTION ---
class WeeklyMacroAveragesSection extends StatelessWidget {
  final Map<String, dynamic> averages;

  const WeeklyMacroAveragesSection({super.key, required this.averages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Container: 3 circular progress indicators
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F1ED),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _MacroCircularProgressGauge(
                  value: '1732',
                  label: 'kcal/day',
                  bottomLabel: '+32 kcal',
                  color: const Color(0xFF72B84D),
                  percent: averages['calories'] as double? ?? 0.75,
                ),
              ),
              Expanded(
                child: _MacroCircularProgressGauge(
                  value: '112g',
                  label: 'Protein',
                  bottomLabel: '93% goal',
                  color: const Color(0xFF906041),
                  percent: averages['protein'] as double? ?? 0.93,
                ),
              ),
              Expanded(
                child: _MacroCircularProgressGauge(
                  value: '165g',
                  label: 'Carbs',
                  bottomLabel: '93% goal',
                  color: const Color(0xFF906041),
                  percent: averages['carbs'] as double? ?? 0.93,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Bottom Container: 2 circular progress indicators, centered and narrower
        Center(
          child: Container(
            width: 260, // Fixed width to keep it centered and compact
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F1ED),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _MacroCircularProgressGauge(
                    value: '61g',
                    label: 'Fat',
                    bottomLabel: '112% goal',
                    color: const Color(0xFF72B84D),
                    percent: averages['fat'] as double? ?? 1.12,
                  ),
                ),
                Expanded(
                  child: _MacroCircularProgressGauge(
                    value: '18g',
                    label: 'Fiber',
                    bottomLabel: '93% goal',
                    color: const Color(0xFF906041),
                    percent: averages['fiber'] as double? ?? 0.93,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MacroCircularProgressGauge extends StatelessWidget {
  final String value;
  final String label;
  final String bottomLabel;
  final Color color;
  final double percent;

  const _MacroCircularProgressGauge({
    required this.value,
    required this.label,
    required this.bottomLabel,
    required this.color,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 85,
              width: 85,
              child: CustomPaint(
                painter: _MacroCircularGaugePainter(
                  percent: percent,
                  color: color,
                  strokeWidth: 5,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: getTextStyle(
                    color: const Color(0xFF4A2B1D),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: getTextStyle(
                    color: const Color(0xFF5F5149),
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          bottomLabel,
          style: getTextStyle(
            color: const Color(0xFF906041),
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _MacroCircularGaugePainter extends CustomPainter {
  final double percent;
  final Color color;
  final double strokeWidth;

  _MacroCircularGaugePainter({
    required this.percent,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final center = Offset(width / 2, height / 2);
    final radius = min(width / 2, height / 2) - strokeWidth / 2;

    final Paint trackPaint = Paint()
      ..color = const Color(0xFFE6DDD5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, trackPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * percent.clamp(0.0, 1.0),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
