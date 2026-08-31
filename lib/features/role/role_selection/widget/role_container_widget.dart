import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class RoleContainerWidget extends StatelessWidget {
  final bool isUser;
  final VoidCallback onTap;

  const RoleContainerWidget({
    super.key,
    required this.isUser,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool user = isUser;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 290),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.secondaryTextColor.withValues(alpha: .25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Image.asset(
                    user ? IconPath.userProfile1 : IconPath.userProfile2,
                    height: 40,
                    width: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    user ? 'User' : 'Provider',
                    style: getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  user
                      ? 'Track your health, connect with providers, and manage your wellness journey.'
                      : 'Verify your credentials, manage patients and grow your practice',
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
              decoration: BoxDecoration(
                color: user
                    ? const Color(0xffD1763F)
                    : const Color(0xff526C3D),
                borderRadius: BorderRadius.circular(100),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  user ? "I’m a User  →" : "I’m a Provider →",
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.tertiaryTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
