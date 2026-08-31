import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_subscription/model/user_subscription_model.dart';

class UserSubscriptionController extends GetxController {
  final isLoading = false.obs;

  final plan = const UserSubscriptionModel(
    title: 'Premium Dashboard',
    price: '\$8.99/month',
    features: [
      'Everything in free, plus:',
      '5–10 AI recommendations/day',
      'Full weekly & monthly data reports',
      'Access to all health providers',
      'Full calorie surplus/deficit analysis',
      'Progress tracking with charts (daily / weekly / monthly)',
    ],
  );

  Future<void> purchase() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}