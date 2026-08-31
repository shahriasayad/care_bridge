import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/profile/profile_main/model/provider_profile_model.dart';

class ProviderMenuList extends StatelessWidget {
  final List<ProviderProfileMenuItem> items;
  final void Function(ProviderProfileMenuItem) onTap;

  const ProviderMenuList({super.key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.borderColor,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) =>
            _MenuItem(item: items[index], onTap: onTap),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final ProviderProfileMenuItem item;
  final void Function(ProviderProfileMenuItem) onTap;

  const _MenuItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(item),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.title,
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: item.title == 'Log Out'
                    ? AppColors.secondaryTextColor
                    : AppColors.primaryTextColor,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.secondaryTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
