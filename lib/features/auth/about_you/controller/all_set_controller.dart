import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class AllSetController extends GetxController {
  void continueToNext() {
    Get.toNamed(AppRoutes.getPremiumScreen);
  }
}
