import 'package:get/get.dart';
import 'package:care_bridge/features/role/provider/client_details/controller/client_details_controller.dart';

class ClientDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientDetailsController>(() => ClientDetailsController());
  }
}
