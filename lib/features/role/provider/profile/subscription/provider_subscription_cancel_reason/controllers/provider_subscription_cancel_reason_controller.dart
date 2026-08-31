import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class ProviderSubscriptionCancelReasonController extends GetxController {
  final RxString selectedReason = 'Too expensive'.obs;

  void selectReason(String reason) {
    selectedReason.value = reason;
  }

  void submitFeedback() {
    Get.toNamed(AppRoutes.getProviderSubscriptionCancelSuccessScreen());
  }
}
