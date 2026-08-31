import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:care_bridge/features/bottom_nav/widget/custom_bottom_navbar.dart';
import 'package:care_bridge/features/role/provider/appointment/screen/provider_appointment_screen.dart';
import 'package:care_bridge/features/role/provider/home/screen/provider_home_screen.dart';
import 'package:care_bridge/features/role/provider/service/screen/provider_service_screen.dart';
import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';
import 'package:care_bridge/features/role/provider/message/message_list/screen/provider_message_screen.dart';
import 'package:care_bridge/features/role/user/user_home/screen/user_home_screen.dart';
import 'package:care_bridge/features/role/user/user_insurance/screen/user_insurance_screen.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/screen/user_profile_screen.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/screen/user_services_screen.dart';
import 'package:care_bridge/features/role/user/user_track/screen/user_track_meal_screen.dart';
import 'package:care_bridge/features/role/provider/profile/profile_main/screen/provider_profile_screen.dart';
import 'package:care_bridge/features/role/user/user_log_exercise/screen/user_log_exercise_screen.dart';


class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomNavController navController = Get.find<BottomNavController>();
  final RoleController roleController = Get.find<RoleController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List<Widget> userPages = [
        UserHomeScreen(),
        UserTrackMealScreen(),
        UserServicesScreen(),
        UserInsuranceScreen(),
        const UserLogExerciseScreen(),
        UserProfileScreen(),
      ];

      final List<Widget> providerPages = [
        ProviderHomeScreen(),
        ProviderAppointmentScreen(),
        ProviderServiceScreen(),
        const ProviderMessageScreen(),
        const ProviderProfileScreen(),
      ];

      final pages = roleController.isProvider ? providerPages : userPages;

      return Scaffold(
        backgroundColor: Colors.white,

        body: pages[navController.currentIndex.value],

        bottomNavigationBar: CustomBottomNavbar(),
      );
    });
  }
}
