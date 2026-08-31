import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';
import 'package:care_bridge/features/role/provider/client_details/widgets/metric_progress_card.dart';

class ClientMetricsSection extends StatelessWidget {
  final ClientDetailsController controller;

  const ClientMetricsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMetricCardsGrid(),
        const SizedBox(height: 20),
        _buildTrendsList(),
      ],
    );
  }

  Widget _buildMetricCardsGrid() {
    final metrics = controller.coreMetrics;

    final iconSources = [
      IconPath.stepsIcon,
      IconPath.caloriesIcon,
      IconPath.waterIcon,
      IconPath.sleepIcon,
    ];

    List<Widget> rows = [];
    for (int i = 0; i < metrics.length; i += 2) {
      final hasNext = i + 1 < metrics.length;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildCard(metrics[i], i, iconSources),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: hasNext
                    ? _buildCard(metrics[i + 1], i + 1, iconSources)
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
      if (i + 2 < metrics.length) {
        rows.add(const SizedBox(height: 12));
      }
    }

    return Column(
      children: rows,
    );
  }

  Widget _buildCard(Map<String, dynamic> metric, int index, List<dynamic> iconSources) {
    final iconSource = (index < iconSources.length)
        ? iconSources[index]
        : Icons.help_outline;

    return MetricProgressCard(
      title: metric['title'],
      value: metric['value'],
      goalText: metric['goalText'],
      percent: metric['percent'],
      assetPath: iconSource is String ? iconSource : null,
      icon: iconSource is IconData ? iconSource : null,
    );
  }

  Widget _buildTrendsList() {
    return Column(
      children: controller.trends.map((trend) {
        dynamic trendIcon;
        late Color iconColor;

        switch (trend['title']) {
          case 'Weight':
            trendIcon = Icons.shopping_bag_outlined;
            iconColor = AppColors.completedColor;
            break;
          case 'Calories':
            trendIcon = IconPath.caloriesIcon; 
            iconColor = Colors.orange;
            break;
          case 'Sleep':
            trendIcon = Icons.nights_stay_outlined;
            iconColor = Colors.indigo;
            break;
          default:
            trendIcon = IconPath.stepsIcon; 
            iconColor = AppColors.completedColor;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              trendIcon is String
                  ? Image.asset(
                      trendIcon,
                      width: 18,
                      height: 18,
                      color: iconColor,
                    )
                  : Icon(trendIcon, size: 18, color: iconColor),
              const SizedBox(width: 8),
              Text(
                trend['title'],
                style: getTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_upward,
                size: 14,
                color: AppColors.completedColor,
              ),
              const SizedBox(width: 4),
              Text(
                trend['change'],
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.completedColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                trend['comparison'],
                style: getTextStyle(
                  fontSize: 12,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
