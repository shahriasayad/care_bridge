import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';

class UserProviderHeader extends StatelessWidget {
  final UserProviderModel provider;
  const UserProviderHeader({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.providerCardBackgroundColor,
            borderRadius:  BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFAF2EC),
                      ),
                      child:  Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                   Expanded(
                    child: Center(
                      child: Text(
                        'Provider Details',
                        style: getTextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(width: 44),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          child: Container(
            padding:  EdgeInsets.all(4),
            decoration:  BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 45,
              backgroundImage: provider.image.startsWith('http')
                  ? NetworkImage(provider.image)
                  : AssetImage(provider.image) as ImageProvider,
            ),
          ),
        ),
      ],
    );
  }
}
