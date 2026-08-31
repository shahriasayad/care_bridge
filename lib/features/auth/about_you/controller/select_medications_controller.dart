import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectMedicationsController extends GetxController {
  var selectedMedications = <String>[].obs;

  void toggleMedication(String med) {
    if (med == 'None') {
      selectedMedications.clear();
      selectedMedications.add('None');
    } else {
      selectedMedications.remove('None');
      if (selectedMedications.contains(med)) {
        selectedMedications.remove(med);
      } else {
        selectedMedications.add(med);
      }
    }
  }

  bool isSelected(String med) {
    return selectedMedications.contains(med);
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.allSetScreen);
  }
}
