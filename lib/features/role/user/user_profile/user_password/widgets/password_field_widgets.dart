import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class PasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    required this.label,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '*',
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.cancelledColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
            filled: true,
            fillColor: AppColors.backgroundColor,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: IconButton(
              onPressed: onToggle,
              icon: Icon(
                obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.secondaryTextColor,
                size: 20,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryButtonColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.cancelledColor,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.cancelledColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
