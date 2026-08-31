import 'package:flutter/material.dart';

class SparklineChart extends StatelessWidget {
  final List<double> data;
  final Color color;
  final double strokeWidth;
  final bool fill;

  const SparklineChart({
    super.key,
    required this.data,
    required this.color,
    this.strokeWidth = 2.0,
    this.fill = true,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox();

    return CustomPaint(
      painter: _SparklinePainter(
        data: data,
        color: color,
        strokeWidth: strokeWidth,
        fill: fill,
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color color;
  final double strokeWidth;
  final bool fill;

  _SparklinePainter({
    required this.data,
    required this.color,
    required this.strokeWidth,
    required this.fill,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;

    final double minVal = data.reduce((a, b) => a < b ? a : b);
    final double maxVal = data.reduce((a, b) => a > b ? a : b);
    final double range = maxVal - minVal == 0 ? 1 : maxVal - minVal;

    final double width = size.width;
    final double height = size.height;

    final double xStep = width / (data.length - 1);

    final Path path = Path();
    final List<Offset> points = [];

    for (int i = 0; i < data.length; i++) {
      final double x = i * xStep;
      // Invert Y because canvas origin (0,0) is top-left
      final double normalizedY = (data[i] - minVal) / range;
      final double y = height - (normalizedY * (height - strokeWidth * 2) + strokeWidth);
      points.add(Offset(x, y));
    }

    // Begin path
    path.moveTo(points[0].dx, points[0].dy);

    // Draw smooth path using quadratic bezier curves
    for (int i = 0; i < points.length - 1; i++) {
      final Offset p0 = points[i];
      final Offset p1 = points[i + 1];
      final Offset controlPoint = Offset((p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
      path.quadraticBezierTo(p0.dx, p0.dy, controlPoint.dx, controlPoint.dy);
    }
    
    path.lineTo(points.last.dx, points.last.dy);

    final Paint linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    if (fill) {
      final Path fillPath = Path.from(path);
      fillPath.lineTo(width, height);
      fillPath.lineTo(0, height);
      fillPath.close();

      final Paint fillPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.withValues(alpha: 0.25),
            color.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, width, height))
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      canvas.drawPath(fillPath, fillPaint);
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.fill != fill;
  }
}
