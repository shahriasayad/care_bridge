import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class ProviderCancelSubscriptionController extends GetxController {
  void proceedToFeedback() {
    Get.toNamed(AppRoutes.getProviderSubscriptionCancelFeedbackScreen());
  }

  void cancelAnyway() {
    Get.toNamed(AppRoutes.getProviderSubscriptionCancelReasonScreen());
  }
}