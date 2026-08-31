import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';

class SuccessScreen extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onTap;
  const SuccessScreen({
    super.key,
    required this.message,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(ImagePath.successImage, height: 164, width: 164),
              SizedBox(height: 12),
              Text(
                'Success!',
                style: getTextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                message,
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: 70),
              Spacer(),
              CustomButton(
                text: buttonText,
                onTap: () {
                  onTap?.call();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
