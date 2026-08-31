// import 'package:flutter/material.dart';
// import 'package:care_bridge/core/const/app_colors.dart';
// import 'package:care_bridge/core/const/global_text_style.dart';

// class TodaysProgressWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> data;
//   const TodaysProgressWidget({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding:EdgeInsets.zero,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: data.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.3,
//       ),
//       itemBuilder: (_, i) {
//         final item = data[i];
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           decoration: BoxDecoration(color: AppColors.containerColor, borderRadius: BorderRadius.circular(16)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset(item['iconPath'] as String, width: 24, height: 24, color: AppColors.iconColor),
//               const SizedBox(height: 16),
//               Text(item['title'] as String,
//                   style: getTextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.secondaryTextColor)),
//               const SizedBox(height: 2),
//               Text(item['value'] as String,
//                   style: getTextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.primaryTextColor)),
//               const SizedBox(height: 2),
//               Text(item['goal'] as String,
//                   style: getTextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.secondaryTextColor)),
//               const SizedBox(height: 16),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(50),
//                 child: LinearProgressIndicator(
//                   value: item['progress'] as double,
//                   minHeight: 5,
//                   backgroundColor: AppColors.iconBackground,
//                   valueColor: AlwaysStoppedAnimation<Color>(AppColors.iconColor),
                  
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';

class TodaysProgressWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const TodaysProgressWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, i) {
        final item = data[i];

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item['iconPath'] as String,
                width: 24,
                height: 24,
                color: AppColors.iconColor,
              ),

              const SizedBox(height: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      item['value'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getTextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      item['goal'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              //const SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: LinearProgressIndicator(
                  value: item['progress'] as double,
                  minHeight: 4,
                  backgroundColor: AppColors.iconBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.iconColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}