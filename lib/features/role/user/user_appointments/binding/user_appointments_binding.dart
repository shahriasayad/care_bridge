import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_appointments/controller/user_appointments_controller.dart';

class UserAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAppointmentsController>(() => UserAppointmentsController());
  }
}
