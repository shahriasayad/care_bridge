import 'package:get/get.dart';
import 'package:care_bridge/features/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:care_bridge/features/bottom_nav/screen/bottom_nav_screen.dart';

class GetPremiumController extends GetxController {
  void purchase() {
    Get.offAll(() => BottomNavScreen(), binding: BottomNavBinding());
  }

  void skip() {
    Get.offAll(() => BottomNavScreen(), binding: BottomNavBinding());
  }
}
