import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserTrackMealController extends GetxController {
  final RxInt selectedTab = 0.obs;

  final Rx<File?> pickedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  final RxString textInput = ''.obs;

  final RxBool isRecording = false.obs;

  final RxBool showPreview = true.obs;

  final Map<String, dynamic> detectedMeal = {
    'name': 'Grilled Chicken Salad',
    'serving': 'Estimated serving: 1 bowl',
    'calories': '450 cal',
    'totalCalories': '1,45',
    'carbs': '15g',
    'protein': '36g',
    'fat': '22g',
  };

  final List<Map<String, dynamic>> recommendations = [
    {
      'name': 'Greek Yogurt Bowl',
      'time': '8:30 AM',
      'protein': '22g',
      'carbs': '35g',
      'fat': '10g',
      'calories': 120,
    },
    {
      'name': 'Greek Yogurt Bowl',
      'time': '8:30 AM',
      'protein': '22g',
      'carbs': '35g',
      'fat': '10g',
      'calories': 120,
    },
    {
      'name': 'Greek Yogurt Bowl',
      'time': '8:30 AM',
      'protein': '22g',
      'carbs': '35g',
      'fat': '10g',
      'calories': 120,
    },
    {
      'name': 'Greek Yogurt Bowl',
      'time': '8:30 AM',
      'protein': '22g',
      'carbs': '35g',
      'fat': '10g',
      'calories': 120,
    },
  ];

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void toggleRecording() {
    isRecording.value = !isRecording.value;
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (image != null) {
        pickedImage.value = File(image.path);
      }
    } catch (e) {
      EasyLoading.showError('Failed to pick image: $e');
    }
  }

  Future<void> uploadImage() async {
    if (pickedImage.value == null) return;

    EasyLoading.show(status: 'Analyzing image...');
    await Future.delayed(const Duration(milliseconds: 2000));
    EasyLoading.showSuccess('Image analyzed successfully!');
  }

  Future<void> confirmMeal() async {
    EasyLoading.show(status: 'Logging meal...');
    await Future.delayed(const Duration(milliseconds: 1200));
    EasyLoading.showSuccess(
      'Meal Confirmed!\nGrilled Chicken Salad has been logged.',
    );
  }
}
