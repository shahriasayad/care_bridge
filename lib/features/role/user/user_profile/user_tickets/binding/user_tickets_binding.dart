import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/controller/user_tickets_controller.dart';

class UserTicketsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserTicketsController>(() => UserTicketsController());
  }
}
