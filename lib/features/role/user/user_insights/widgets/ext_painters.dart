import 'dart:math' as math;

import 'package:flutter/material.dart';

class SemiGaugePainter extends CustomPainter {
  final double value;
  final Color color;
  final Color trackColor;
  final double strokeWidth;

  const SemiGaugePainter({
    required this.value,
    required this.color,
    required this.trackColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(8, 8, size.width - 16, size.height * 1.52);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    paint.color = trackColor;
    canvas.drawArc(rect, math.pi, math.pi, false, paint);

    paint.color = color;
    canvas.drawArc(
      rect,
      math.pi,
      math.pi * value.clamp(0.0, 1.0),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant SemiGaugePainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.color != color ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}




class TrendLinePainter extends CustomPainter {
  final Color color;
  final Color fillColor;
  final String badgeText;

  TrendLinePainter({
    required this.color,
    required this.fillColor,
    required this.badgeText,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // The curve in Figma:
    // Starts at bottom-left, goes flat, then rises, flattens a bit, rises steeply, ends near top-right.
    final points = [
      Offset(0, size.height), // May 1
      Offset(size.width * 0.20, size.height * 0.85), // May 2
      Offset(size.width * 0.40, size.height * 0.80), // May 3
      Offset(size.width * 0.50, size.height * 0.75), // May 4
      Offset(size.width * 0.70, size.height * 0.35), // May 5
      Offset(size.width * 0.85, size.height * 0.15), // May 6
      Offset(size.width, size.height * 0.10), // May 7 (highest point)
    ];

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    
    // Draw smooth bezier curve
    for (var i = 1; i < points.length; i++) {
      final previous = points[i - 1];
      final current = points[i];
      final controlX = (previous.dx + current.dx) / 2;
      path.cubicTo(controlX, previous.dy, controlX, current.dy, current.dx, current.dy);
    }

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, Paint()..color = fillColor);
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );

    // Draw the dot at the end
    final endPoint = points.last;
    canvas.drawCircle(endPoint, 3.5, Paint()..color = color);

    // Draw the tooltip (badgeText) above the dot
    final textPainter = TextPainter(
      text: TextSpan(
        text: badgeText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    const paddingX = 8.0;
    const paddingY = 4.0;
    final tooltipWidth = textPainter.width + paddingX * 2;
    final tooltipHeight = textPainter.height + paddingY * 2;

    // Tooltip position: Right-aligned with the dot, above it
    final tooltipRect = Rect.fromLTWH(
      endPoint.dx - tooltipWidth + 4, // Shifted slightly so it centers better on the arrow
      endPoint.dy - tooltipHeight - 6, // Above the dot, leaving space for the arrow
      tooltipWidth,
      tooltipHeight,
    );

    final tooltipRRect = RRect.fromRectAndRadius(tooltipRect, const Radius.circular(12));

    // Draw the little arrow pointing down
    final arrowPath = Path()
      ..moveTo(endPoint.dx - 4, tooltipRect.bottom)
      ..lineTo(endPoint.dx, endPoint.dy - 3) // Point to the dot
      ..lineTo(endPoint.dx - 8, tooltipRect.bottom)
      ..close();

    final tooltipPaint = Paint()..color = color;
    canvas.drawPath(arrowPath, tooltipPaint);
    canvas.drawRRect(tooltipRRect, tooltipPaint);

    // Draw the text inside the tooltip
    textPainter.paint(
      canvas,
      Offset(
        tooltipRect.left + paddingX,
        tooltipRect.top + paddingY,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant TrendLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.fillColor != fillColor ||
        oldDelegate.badgeText != badgeText;
  }
}

class SemiCircleGaugePainter extends CustomPainter {
  final double valuePct;
  final Color color;

  SemiCircleGaugePainter({required this.valuePct, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 4);
    final radius = (size.width / 2) - 4;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    paint.color = color.withOpacity(0.15);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      paint,
    );

    paint.color = color;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * valuePct.clamp(0.0, 1.0),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ConcentricRingsPainter extends CustomPainter {
  final double stepsPct;
  final double caloriesPct;
  final double minutesPct;
  final Color stepsColor;
  final Color caloriesColor;
  final Color minutesColor;

  ConcentricRingsPainter({
    required this.stepsPct,
    required this.caloriesPct,
    required this.minutesPct,
    required this.stepsColor,
    required this.caloriesColor,
    required this.minutesColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    void drawRing(double radius, Color color, double pct) {
      paint.color = color.withOpacity(0.15);
      canvas.drawCircle(center, radius, paint);
      paint.color = color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        math.pi * 2 * pct.clamp(0.0, 1.0),
        false,
        paint,
      );
    }

    drawRing(40.0, stepsColor, stepsPct);
    drawRing(30.0, caloriesColor, caloriesPct);
    drawRing(20.0, minutesColor, minutesPct);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
