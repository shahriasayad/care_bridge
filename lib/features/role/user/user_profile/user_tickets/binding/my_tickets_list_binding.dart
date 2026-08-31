import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/controller/my_tickets_list_controller.dart';

class MyTicketsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTicketsListController>(() => MyTicketsListController());
  }
}
