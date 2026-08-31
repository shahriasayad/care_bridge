import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectConditionsController extends GetxController {
  var selectedCondition = 'No Known conditions'.obs;

  void selectCondition(String condition) {
    selectedCondition.value = condition;
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectMedicationsScreen);
  }
}
