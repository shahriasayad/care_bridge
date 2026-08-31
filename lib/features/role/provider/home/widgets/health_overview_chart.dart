import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/home/model/provider_home_data.dart';

class HealthOverviewChart extends StatelessWidget {
  final List<HealthOverviewSegment> segments;
  final double score;
  final String scoreText;
  final double size;
  final double strokeWidth;

  const HealthOverviewChart({
    super.key,
    required this.segments,
    required this.score,
    required this.scoreText,
    this.size = 200.0,
    this.strokeWidth = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _DonutChartPainter(
              segments: segments,
              strokeWidth: strokeWidth,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Overall Health\nScore',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${score.toInt()}%',
                style: getTextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                scoreText,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWithgreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  final List<HealthOverviewSegment> segments;
  final double strokeWidth;

  _DonutChartPainter({required this.segments, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    if (segments.isEmpty) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    double total = segments.map((s) => s.percentage).reduce((a, b) => a + b);
    if (total == 0) total = 1;

    // Start at top center (-pi/2)
    double startAngle = -math.pi / 2;

    for (var segment in segments) {
      if (segment.percentage == 0) continue;

      final double sweepAngle = (segment.percentage / total) * 2 * math.pi;

      final paint = Paint()
        ..color = segment.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.square
        ..isAntiAlias = true;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) {
    return oldDelegate.segments != segments ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
