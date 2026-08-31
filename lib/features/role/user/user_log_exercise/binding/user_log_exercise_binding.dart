import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_log_exercise/controller/user_log_exercise_controller.dart';

class UserLogExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLogExerciseController>(() => UserLogExerciseController());
  }
}
