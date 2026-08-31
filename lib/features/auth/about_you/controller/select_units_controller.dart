import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectUnitsController extends GetxController {
  var selectedUnit = 'Metric'.obs;

  void selectUnit(String unit) {
    selectedUnit.value = unit;
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectHeightScreen);
  }
}
