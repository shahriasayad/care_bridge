import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class CreateSplashScreenController extends GetxController {
  void navigateToNext() {
    Get.toNamed(AppRoutes.aboutYouScreen);
  }
}
