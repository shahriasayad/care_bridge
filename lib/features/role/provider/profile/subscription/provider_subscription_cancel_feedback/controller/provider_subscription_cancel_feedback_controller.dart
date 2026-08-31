import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class ProviderSubscriptionCancelFeedbackController extends GetxController {
  final TextEditingController feedbackController = TextEditingController();
  final RxInt characterCount = 0.obs;
  final int maxCharacters = 500;

  void updateCharacterCount(String value) {
    characterCount.value = value.length;
  }

  void submitFeedback() {
    Get.toNamed(AppRoutes.getProviderSubscriptionCancelSuccessScreen());
  }

  void cancelSubscriptionAnyway() {
    Get.back();
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}