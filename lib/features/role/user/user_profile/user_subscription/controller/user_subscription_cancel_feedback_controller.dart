import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserSubscriptionCancelFeedbackController extends GetxController {
  final feedbackController = TextEditingController();
  final characterCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    feedbackController.addListener(() {
      characterCount.value = feedbackController.text.length;
    });
  }

  void continueToConfirmation() {
    Get.toNamed(AppRoutes.getUserSubscriptionCancelConfirmationScreen());
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}
