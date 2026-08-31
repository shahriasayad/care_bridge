import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_services/user_booking/controller/user_booking_controller.dart';

class UserBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserBookingController>(() => UserBookingController());
  }
}
