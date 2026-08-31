import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/controller/user_provider_details_controller.dart';

class UserProviderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProviderDetailsController>(() => UserProviderDetailsController());
  }
}
