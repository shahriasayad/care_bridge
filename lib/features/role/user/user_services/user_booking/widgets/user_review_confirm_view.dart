import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/controller/user_booking_controller.dart';

class UserReviewConfirmView extends StatelessWidget {
  final UserBookingController controller;
  const UserReviewConfirmView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final provider = controller.provider;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review and Confirm Your Booking',
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: provider.image.startsWith('http')
                      ? NetworkImage(provider.image)
                      : AssetImage(provider.image) as ImageProvider,
                ),
                const SizedBox(height: 12),
                Text(
                  provider.name,
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Text(
                  provider.specialty,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${provider.rating} (${provider.reviews} reviews)',
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.providerCardBackgroundColor,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      provider.location.split(',').first.trim(),
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
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildDetailRow('Service', controller.selectedService.name),
                const SizedBox(height: 16),
                _buildDetailRow('Date', controller.formattedDate),
                const SizedBox(height: 16),
                _buildDetailRow('Time', controller.selectedTime.value),
                const SizedBox(height: 16),
                _buildDetailRow(
                  'Platform Fee',
                  '\$${controller.platformFee.toInt()}',
                ),
                const Divider(height: 32),
                _buildDetailRow(
                  'Total',
                  '\$${controller.totalAmount.toInt()}',
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          value,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isTotal
                ? AppColors.primaryButtonColor
                : AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
