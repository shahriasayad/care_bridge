import 'dart:math';
import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class SemiCircleGauge extends StatelessWidget {
  final String title;
  final String value;
  final double percent;
  final Color progressColor;
  final double gaugeWidth;
  final double gaugeHeight;
  final double fontSizeMultiplier;

  const SemiCircleGauge({
    super.key,
    required this.title,
    required this.value,
    required this.percent,
    required this.progressColor,
    this.gaugeWidth = 90.0,
    this.gaugeHeight = 50.0,
    this.fontSizeMultiplier = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: gaugeWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomPaint(
                  size: Size(gaugeWidth, gaugeHeight),
                  painter: _SemiCircleGaugePainter(
                    percent: percent,
                    color: progressColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: getTextStyle(
                          fontSize: 9 * fontSizeMultiplier,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        value,
                        style: getTextStyle(
                          fontSize: 12 * fontSizeMultiplier,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF4A2B1D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Good',
              style: getTextStyle(
                fontSize: 9 * fontSizeMultiplier,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF16A34A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SemiCircleGaugePainter extends CustomPainter {
  final double percent;
  final Color color;

  _SemiCircleGaugePainter({required this.percent, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final center = Offset(width / 2, height);
    final double stroke = 4.0 + (width / 40.0);
    final radius = min(width / 2, height) - stroke / 2 - 1;
    final Paint trackPaint = Paint()
      ..color = const Color(0xFFE6DDD5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      trackPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi * percent.clamp(0.0, 1.0),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
