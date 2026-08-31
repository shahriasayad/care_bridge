import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';

class UserProviderDetailsController extends GetxController {
  late final UserProviderModel provider;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is UserProviderModel) {
      provider = Get.arguments as UserProviderModel;
    } else {
      throw Exception('UserProviderDetailsController: UserProviderModel arguments missing');
    }
  }

  var selectedTab = 0.obs;
  var selectedServiceIndex = 0.obs;

  // Review state
  var userRating = 0.obs;
  var reviewMessage = ''.obs;

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void selectService(int index) {
    selectedServiceIndex.value = index;
  }

  void updateRating(int rating) {
    userRating.value = rating;
  }
}
