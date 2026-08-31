import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';

class CustomBottomNavbar extends StatelessWidget {
  CustomBottomNavbar({super.key});

  final BottomNavController navController = Get.find<BottomNavController>();
  final RoleController roleController = Get.find<RoleController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isProvider = roleController.isProvider;

      final List<String> userTitles = [
        'Home',
        'Track',
        'Care',
        'Insurance',
        'Log Exercise',
        'Profile',
      ];

      final List<String> providerTitles = [
        'Home',
        'Appointments',
        'Services',
        'Message',
        'Profile',
      ];

      final List<String> userIcons = [
        IconPath.userHomeIcon,
        IconPath.userTrackIcon,
        IconPath.userServicesIcon,
        IconPath.userInsuranceIcon,
        IconPath.logExerciseIcon,
        IconPath.userProfileIcon,
      ];

      final List<String> providerIcons = [
        IconPath.providerHomeIcon,
        IconPath.providerAppointmentIcon,
        IconPath.providerServicesIcon,
        IconPath.providerMessageIcon,
        IconPath.providerProfileIcon,
      ];

      final List<String> icons = isProvider ? providerIcons : userIcons;

      final List<String> titles = isProvider ? providerTitles : userTitles;

      return Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          color: Color(0xffFDF9F6),
          border: Border(top: BorderSide(color: Color(0xffEAEAEA), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(titles.length, (index) {
            final bool isSelected = navController.currentIndex.value == index;

            return Expanded(
              child: InkWell(
                onTap: () {
                  navController.changeIndex(index);
                },

                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icons[index] == IconPath.logExerciseIcon
                        ? Image.asset(
                            IconPath.logExerciseIcon,
                            height: 26,
                            width: 26,
                            color: isSelected
                                ? const Color(0xffB07B56)
                                : const Color(0xff4A3428),
                          )
                        : Image.asset(
                            icons[index],
                            height: 24,
                            width: 24,
                            color: isSelected
                                ? const Color(0xffB07B56)
                                : const Color(0xff4A3428),
                          ),
                    const SizedBox(height: 8),
                    Text(
                      titles[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? const Color(0xffB07B56)
                            : const Color(0xff4A3428),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
