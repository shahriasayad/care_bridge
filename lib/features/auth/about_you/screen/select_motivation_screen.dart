import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/auth/about_you/controller/select_motivation_controller.dart';

class SelectMotivationScreen extends StatelessWidget {
  const SelectMotivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectMotivationController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.iconBackground,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: AppColors.primaryTextColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Text(
                    "About You",
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 40), // Spacing placeholder for symmetry
                ],
              ),
              const SizedBox(height: 20),
              // Horizontal Step Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const LinearProgressIndicator(
                  value: 0.5,
                  minHeight: 4,
                  backgroundColor: AppColors.borderColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.iconColor,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // Screen Main Title
              Text(
                "On a scale of 1-10,how\nmotivated are you?",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),
              // Screen Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "This helps us keep you motivated with the right support",
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 85),
              // Centered Motivation Gauge Selector
              Obx(
                () => SizedBox(
                  width: 258,
                  height: 258,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Semi-circular Interactive Arc Slider
                      MotivationGauge(
                        value: controller.motivationLevel.value.toDouble(),
                        onChanged: (val) {
                          controller.updateMotivation(val.round());
                        },
                      ),
                      // Centered Text Display
                      Positioned(
                        bottom: 45,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${controller.motivationLevel.value}",
                              style: getTextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              controller.motivationLabel,
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Marking "1" on the left
                      Positioned(
                        left: 16,
                        bottom: 12,
                        child: Text(
                          "1",
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ),
                      // Marking "10" on the right
                      Positioned(
                        right: 14,
                        bottom: -5,
                        child: Text(
                          "10",
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              // Bottom Continue Button
              CustomButton(text: "Continue", onTap: controller.continueToNext),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class MotivationGauge extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const MotivationGauge({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => _handleTouch(context, details.localPosition),
      onPanDown: (details) => _handleTouch(context, details.localPosition),
      child: SizedBox(
        width: 258,
        height: 200,
        child: CustomPaint(painter: _GaugePainter(value: value)),
      ),
    );
  }

  void _handleTouch(BuildContext context, Offset localPosition) {
    final box = context.findRenderObject() as RenderBox;
    final center = Offset(box.size.width / 2, box.size.height - 30);
    final dx = localPosition.dx - center.dx;
    final dy = localPosition.dy - center.dy;

    if (dy < 15) {
      final angle = math.atan2(-dy, dx);

      final progress = (math.pi - angle) / math.pi;
      final newValue = (progress * 9 + 1).clamp(1.0, 10.0);
      onChanged(newValue);
    }
  }
}

class _GaugePainter extends CustomPainter {
  final double value;

  _GaugePainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 30);
    final radius = size.width / 2 - 25;

    // Track line (inactive progress)
    final trackPaint = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22.0
      ..strokeCap = StrokeCap.round;

    final activePaint = Paint()
      ..color = AppColors.iconColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22.0
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(rect, math.pi, math.pi, false, trackPaint);

    final progress = (value - 1) / 9.0;
    final sweepAngle = progress * math.pi;
    canvas.drawArc(rect, math.pi, sweepAngle, false, activePaint);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
