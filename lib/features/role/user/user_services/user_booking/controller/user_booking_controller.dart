import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_services/user_main_services/model/user_provider_model.dart';

import 'package:care_bridge/features/role/user/user_services/user_provider_details/controller/user_provider_details_controller.dart';

class UserBookingController extends GetxController {
  late final UserProviderModel provider;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is UserProviderModel) {
      provider = Get.arguments as UserProviderModel;
    } else if (Get.isRegistered<UserProviderDetailsController>()) {
      provider = Get.find<UserProviderDetailsController>().provider;
    } else {
      throw Exception(
        'UserBookingController: UserProviderModel arguments missing',
      );
    }
  }

  var currentStep = 1.obs;

  var selectedServiceIndex = 0.obs;
  var selectedDate = DateTime.now().obs;
  var selectedTime = '10:00'.obs;

  final double platformFee = 19.0;

  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
    }
  }

  void selectService(int index) {
    selectedServiceIndex.value = index;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectTime(String time) {
    selectedTime.value = time;
  }

  UserServiceModel get selectedService =>
      provider.services[selectedServiceIndex.value];

  double get totalAmount => selectedService.price + platformFee;

  String get formattedDate {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return '${days[selectedDate.value.weekday - 1]}, ${months[selectedDate.value.month - 1]} ${selectedDate.value.day}';
  }
}
