import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_payment/model/user_payment_model.dart';

class UserPaymentController extends GetxController {
  final selected = Rxn<UserPaymentModel>();

  final methods = const [
    UserPaymentModel(id: 'stripe', name: 'Select Payment Method'),
  ];

  void select(UserPaymentModel method) => selected.value = method;
}