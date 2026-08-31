import 'package:flutter/material.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';

class BookingInfoTab extends StatelessWidget {
  final ClientDetailsController controller;

  const BookingInfoTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final info = controller.bookingInfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildInfoRow('Status', _buildStatusPill(info['status'])),
              const SizedBox(height: 24),
              _buildInfoRow('Service', _buildText(info['service'])),
              const SizedBox(height: 24),
              _buildInfoRow('Date', _buildText(info['date'])),
              const SizedBox(height: 24),
              _buildInfoRow('Time', _buildText(info['time'])),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  color: Color(0xFFE2F0D9),
                  thickness: 1,
                  height: 1,
                ),
              ),
              _buildInfoRow('Total', _buildTotalText(info['total'])),
            ],
          ),
        ),
        const SizedBox(height: 40),
        _buildBottomActionButtons(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildBottomActionButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(text: 'Message', onTap: () {}),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(text: 'Complete', onTap: () {}),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                backgroundColor: const Color(0xFFFAF1EC),
                text: 'Cancel',
                textColor: AppColors.primaryButtonColor,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(text: 'Download Report', onTap: () {}),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, Widget valueWidget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryTextColor,
          ),
        ),
        valueWidget,
      ],
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryTextColor,
      ),
    );
  }

  Widget _buildTotalText(String text) {
    return Text(
      text,
      style: getTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryButtonColor,
      ),
    );
  }

  Widget _buildStatusPill(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.upcomingColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: getTextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
