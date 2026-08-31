import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/profile/profile_info/model/provider_profile_info_model.dart';

class DayAvailabilityTile extends StatelessWidget {
  final DayAvailability availability;
  final List<String> timeSlots;
  final ValueChanged<bool> onToggle;
  final ValueChanged<String?> onFromChanged;
  final ValueChanged<String?> onToChanged;

  const DayAvailabilityTile({
    super.key,
    required this.availability,
    required this.timeSlots,
    required this.onToggle,
    required this.onFromChanged,
    required this.onToChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                availability.dayName,
                style: getTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Switch(
                value: availability.isAvailable,
                onChanged: onToggle,
                activeThumbColor: AppColors.backgroundColor,
                activeTrackColor: AppColors.primaryGraphColor,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Color(0xFFF5F1ED),
              ),
            ],
          ),
          if (availability.isAvailable) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'From ',
                          style: getTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryTextColor,
                          ),
                          children: const [
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      _TimeDropdown(
                        value: availability.fromTime,
                        items: timeSlots,
                        onChanged: onFromChanged,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'To ',
                          style: getTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryTextColor,
                          ),
                          children: const [
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      _TimeDropdown(
                        value: availability.toTime,
                        items: timeSlots,
                        onChanged: onToChanged,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 4),
            Text(
              'Off this day',
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TimeDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _TimeDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Standardize validation: ensure the current value exists in items
    final selectedValue = (value != null && items.contains(value))
        ? value
        : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            'Select',
            style: getTextStyle(
              fontSize: 14,
              color: AppColors.secondaryTextColor.withValues(alpha: 0.6),
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.secondaryTextColor,
            size: 20,
          ),
          isExpanded: true,
          style: getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryTextColor,
          ),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(value: val, child: Text(val));
          }).toList(),
        ),
      ),
    );
  }
}
