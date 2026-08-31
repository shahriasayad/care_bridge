import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';

class ClientDetailsHeader extends StatelessWidget {
  final ClientDetailsController controller;

  const ClientDetailsHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImagePath.profile1),
              radius: 36,
              backgroundColor: AppColors.borderColor,
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.completedColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Patient Profile",
                style: getTextStyle(
                  fontSize: 12,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                controller.name,
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.completedColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Status: ${controller.status}",
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: controller.healthScore / 100,
                strokeWidth: 8,
                backgroundColor: const Color(0xFFF0E8E2),
                color: const Color(0xFF9F6E4D),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${controller.healthScore}",
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Text(
                  "Score",
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ClientProviderDetailsGrid extends StatelessWidget {
  final ClientDetailsController controller;

  const ClientProviderDetailsGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.6,
      crossAxisSpacing: 16,
      mainAxisSpacing: 12,
      children: [
        _buildProviderDetailItem("Provider", controller.provider),
        _buildProviderDetailItem("Last Active", controller.lastActive),
        _buildProviderDetailItem("Primary Goal", controller.goal),
        _buildProviderDetailItem("Health ID", controller.healthId),
      ],
    );
  }

  Widget _buildProviderDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: getTextStyle(
            fontSize: 12,
            color: AppColors.secondaryTextColor.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
