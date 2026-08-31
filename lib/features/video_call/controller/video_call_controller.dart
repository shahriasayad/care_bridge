import 'package:get/get.dart';

class VideoCallController extends GetxController {
  final RxBool isCallAccepted = false.obs;

  void acceptCall() {
    isCallAccepted.value = true;
  }

  void declineCall() {
    Get.back();
  }

  void endCall() {
    Get.back();
  }
}
