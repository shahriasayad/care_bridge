import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class ProviderSubscriptionController extends GetxController {
  final RxBool isLoading = false.obs;

  void cancelSubscription() {
    Get.toNamed(AppRoutes.getProviderCancelSubscriptionScreen());
  }
}