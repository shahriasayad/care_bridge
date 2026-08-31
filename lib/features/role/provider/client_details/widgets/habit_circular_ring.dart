import 'dart:math';
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class HabitCircularRing extends StatelessWidget {
  final String title;
  final double percent;
  final String status;
  final Color progressColor;
  final bool isLarge;

  const HabitCircularRing({
    super.key,
    required this.title,
    required this.percent,
    required this.status,
    required this.progressColor,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isLarge ? 120 : 85;
    final double titleFontSize = isLarge ? 10 : 8;
    final double percentFontSize = isLarge ? 16 : 12;
    final double statusFontSize = isLarge ? 10 : 8;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(size, size),
              painter: _HabitCircularRingPainter(
                percent: percent,
                color: progressColor,
                strokeWidth: isLarge ? 8 : 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${(percent * 100).toInt()}%",
                    style: getTextStyle(
                      fontSize: percentFontSize,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    status,
                    style: getTextStyle(
                      fontSize: statusFontSize,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF16A34A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HabitCircularRingPainter extends CustomPainter {
  final double percent;
  final Color color;
  final double strokeWidth;

  _HabitCircularRingPainter({
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
      ..color = const Color(0xFFE1D2C8)
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
