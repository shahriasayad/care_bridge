import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';
import 'package:care_bridge/features/role/role_selection/widget/role_container_widget.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoleController(), permanent: true);
    final images = [
      ImagePath.porfile3,
      ImagePath.profile4,
      ImagePath.profile6,
      ImagePath.profile7,
      ImagePath.profile8,
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(ImagePath.appLogo, width: 110)),

              const SizedBox(height: 59),

              RichText(
                text: TextSpan(
                  style: getTextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                  children: const [
                    TextSpan(text: 'How will you use\n'),
                    TextSpan(
                      text: 'Grovr?',
                      style: TextStyle(color: AppColors.iconColor),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Select your user type to get started with a personalized experience',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),

              const SizedBox(height: 43),

              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = (constraints.maxWidth - 16) / 2;
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: cardWidth,
                          child: RoleContainerWidget(
                            isUser: true,
                            onTap: () {
                              controller.selectRole('User');
                              Get.toNamed('/loginScreen');
                            },
                          ),
                        ),
                  
                        const SizedBox(width: 16),
                  
                        SizedBox(
                          width: cardWidth,
                          child: RoleContainerWidget(
                            isUser: false,
                            onTap: () {
                              controller.selectRole('Provider');
                              Get.toNamed('/loginScreen');
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 43),

              Center(
                child: Column(
                  children: [
                    Text(
                      'Trusted by',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      width: 260,
                      height: 80,
                      child: Stack(
                        children: List.generate(
                          images.length,
                          (index) => Positioned(
                            left: index * 45,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.borderColorTrusted,
                                  width: 1,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(IconPath.trustedSign, height: 16, width: 16),
                        const SizedBox(width: 8),
                        Text(
                          'Secure Private',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
