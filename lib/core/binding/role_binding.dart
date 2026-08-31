import 'package:get/get.dart';
import 'package:care_bridge/features/role/role_selection/controller/role_controller.dart';

class RoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoleController(), permanent: true);
  }
}
