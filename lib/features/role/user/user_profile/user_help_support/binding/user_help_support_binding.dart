import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_help_support/controller/user_help_support_controller.dart';

class UserHelpSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHelpSupportController>(() => UserHelpSupportController());
  }
}
