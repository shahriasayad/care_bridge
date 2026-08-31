import 'package:get/get.dart';
import 'package:care_bridge/features/bottom_nav/controller/bottom_nav_controller.dart';

import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavController>(BottomNavController());
    Get.lazyPut<RoleController>(() => RoleController());
  }
}
