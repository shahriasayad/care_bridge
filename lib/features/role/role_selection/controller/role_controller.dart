import 'package:get/get.dart';

class RoleController extends GetxController {
  final selectedRole = ''.obs;

  void selectRole(String role) => selectedRole.value = role;

  bool get isUser => selectedRole.value == 'User';
  bool get isProvider => selectedRole.value == 'Provider';
}