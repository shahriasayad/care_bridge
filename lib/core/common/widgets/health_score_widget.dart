import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/app_colors.dart';

class HealthScoreWidget extends StatelessWidget {
  final double score;
  final String message;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final Widget? child;
  final bool isGauge;

  const HealthScoreWidget({
    super.key,
    required this.score,
    this.message = 'Great Job!',
    this.size = 220,
    this.progressColor = const Color(0xFF9F6E4D),
    this.backgroundColor = const Color(0xFFE1D2C8),
    this.strokeWidth = 14,
    this.child,
    this.isGauge = false,
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
            painter: _CircularProgressPainter(
              score: score,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
              strokeWidth: strokeWidth,
              isGauge: isGauge,
            ),
          ),
          child ??
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${score.toInt()}%',
                    style: getTextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double score; // 0.0 to 100.0
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final bool isGauge;

  _CircularProgressPainter({
    required this.score,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
    required this.isGauge,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paintBackground = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintProgress = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    if (isGauge) {
      const startAngle = -270.0 * math.pi / 130;
      const totalSweep = 360.0 * math.pi / 180.0;
      final progressSweep = (score.clamp(0.0, 100.0) / 120.0) * totalSweep;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        totalSweep,
        false,
        paintBackground,
      );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        progressSweep,
        false,
        paintProgress,
      );
    } else {
      const startAngle = -270.0 * math.pi / 130.0;
      const totalSweep = 360.0 * math.pi / 180.0;
      final progressSweep = (score.clamp(0.0, 100.0) / 120.0) * totalSweep;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        0.0,
        totalSweep,
        false,
        paintBackground,
      );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        progressSweep,
        false,
        paintProgress,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.score != score ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.isGauge != isGauge;
  }
}
