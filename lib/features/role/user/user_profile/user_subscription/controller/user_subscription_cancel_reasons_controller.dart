import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserSubscriptionCancelReasonsController extends GetxController {
  final selectedReasonIndex = 0.obs;

  final reasons = <String>[
    'Too expensive',
    'Not using it enough',
    'Didn’t get enough value',
    'Found another app or service',
    'Provider issue',
    'AI coach was not helpful',
    'Tecnical issues',
    'Billing issue',
    'Taking a break',
    'Other',
  ];

  void selectReason(int index) {
    selectedReasonIndex.value = index;
  }

  void continueToFeedback() {
    Get.toNamed(AppRoutes.getUserSubscriptionCancelFeedbackScreen());
  }
}
