// import 'package:flutter/material.dart';
// import 'package:care_bridge/core/const/app_colors.dart';
// import 'package:care_bridge/core/const/global_text_style.dart';
// import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

// /// Vertical list of progress rows for each macro nutrient.
// class NutritionProgressCard extends StatelessWidget {
//   const NutritionProgressCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         NutrientProgressRow(
//           label: 'Calories',
//           leftText: '1842/1700 kcal',
//           rightText: '91/100',
//           value: 0.32,
//         ),
//         SizedBox(height: 12),
//         NutrientProgressRow(
//           label: 'Protein',
//           leftText: '128g/120g',
//           rightText: '91/100',
//           value: 0.34,
//         ),
//         SizedBox(height: 12),
//         NutrientProgressRow(
//           label: 'Carbohydrates',
//           leftText: '241.28g/120g',
//           rightText: '128g/120g',
//           value: 0.33,
//         ),
//         SizedBox(height: 12),
//         NutrientProgressRow(
//           label: 'Fat',
//           leftText: '238g/120g',
//           rightText: '74/100',
//           value: 0.33,
//         ),
//         SizedBox(height: 12),
//         NutrientProgressRow(
//           label: 'Fiber',
//           leftText: '238g/120g',
//           rightText: '74/100',
//           value: 0.33,
//         ),
//         SizedBox(height: 12),
//         NutrientProgressRow(
//           label: 'Water',
//           leftText: '238oz/120oz',
//           rightText: '74/100',
//           value: 0.33,
//         ),
//       ],
//     );
//   }
// }

// class NutrientProgressRow extends StatelessWidget {
//   final String label;
//   final String leftText;
//   final String rightText;
//   final double value;

//   const NutrientProgressRow({
//     super.key,
//     required this.label,
//     required this.leftText,
//     required this.rightText,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SoftCard(
//       padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   label,
//                   style: getTextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.secondaryTextColor2,
//                   ),
//                 ),
//               ),
//               Text(
//                 leftText,
//                 style: getTextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.secondaryTextColor,
//                 ),
//               ),
//               const SizedBox(width: 28),
//               Text(
//                 rightText,
//                 style: getTextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.secondaryTextColor,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           InsightProgressBar(value: value),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_shared.dart';

class NutritionProgressCard extends StatelessWidget {
  const NutritionProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NutrientProgressRow(
          label: 'Calories',
          leftText: '1842/1700 kcal',
          rightText: '91/100',
          value: 0.32,
        ),
        SizedBox(height: 12),
        NutrientProgressRow(
          label: 'Protein',
          leftText: '128g/120g',
          rightText: '91/100',
          value: 0.34,
        ),
        SizedBox(height: 12),
        NutrientProgressRow(
          label: 'Carbohydrates',
          leftText: '128g/120g', // Fixed the overlap typo string
          rightText: '91/100',     // Adjusted to match screenshot layout perfectly
          value: 0.33,
        ),
        SizedBox(height: 12),
        NutrientProgressRow(
          label: 'Fat',
          leftText: '238g/120g',
          rightText: '74/100',
          value: 0.33,
        ),
        SizedBox(height: 12),
        NutrientProgressRow(
          label: 'Fiber',
          leftText: '238g/120g',
          rightText: '74/100',
          value: 0.33,
        ),
        SizedBox(height: 12),
        NutrientProgressRow(
          label: 'Water',
          leftText: '238oz/120oz',
          rightText: '74/100',
          value: 0.33,
        ),
      ],
    );
  }
}

class NutrientProgressRow extends StatelessWidget {
  final String label;
  final String leftText;
  final String rightText;
  final double value;

  const NutrientProgressRow({
    super.key,
    required this.label,
    required this.leftText,
    required this.rightText,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      // Corrected to match the beautiful soft mint/green hue from your image
      color: const Color(0xFFF2F9F1), 
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Nutrient label
              Expanded(
                flex: 4,
                child: Text(
                  label,
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryTextColor2,
                  ),
                ),
              ),
              // Center: Intake numerical data values
              Expanded(
                flex: 5,
                child: Text(
                  leftText,
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              // Right: Score performance
              Expanded(
                flex: 3,
                child: Text(
                  rightText,
                  textAlign: TextAlign.end,
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          InsightProgressBar(value: value),
        ],
      ),
    );
  }
}