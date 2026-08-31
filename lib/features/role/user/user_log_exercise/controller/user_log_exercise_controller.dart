import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/features/bottom_nav/controller/bottom_nav_controller.dart';

class UserLogExerciseController extends GetxController {
  final selectedCategory = 'Strength'.obs;
  final descriptionController = TextEditingController();
  final descriptionLength = 0.obs;

  // Duration
  final hours = 0.obs;
  final minutes = 45.obs;
  final seconds = 0.obs;

  // Intensity
  final intensity = 7.0.obs;

  // Details
  final selectedDate = DateTime(2024, 5, 20).obs;
  final selectedTime = const TimeOfDay(hour: 19, minute: 30).obs;
  final selectedLocation = 'Home'.obs;
  final tags = <String>['Lower Body', 'Leg Day'].obs;
  final notesController = TextEditingController();

  // AI Summary
  final aiSummaryText = ''.obs;
  final isGeneratingAiSummary = false.obs;

  final categories = <Map<String, dynamic>>[
    {'name': 'Strength', 'icon': Icons.fitness_center},
    {'name': 'Cardio', 'icon': Icons.directions_run},
    {'name': 'Yoga', 'icon': Icons.self_improvement},
    {'name': 'Pilates', 'icon': Icons.accessibility_new},
  ];

  final locations = ['Home', 'Gym', 'Outdoor', 'Other'];

  @override
  void onInit() {
    super.onInit();
    descriptionController.addListener(() {
      descriptionLength.value = descriptionController.text.length;
    });
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updateDuration(int h, int m, int s) {
    hours.value = h;
    minutes.value = m;
    seconds.value = s;
  }

  void updateIntensity(double val) {
    intensity.value = val;
  }

  void addTag(String tag) {
    if (tag.isNotEmpty && !tags.contains(tag)) {
      tags.add(tag);
    }
  }

  void removeTag(String tag) {
    tags.remove(tag);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xffB07B56),
              onPrimary: Colors.white,
              onSurface: Color(0xff4A3428),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xffB07B56),
              onPrimary: Colors.white,
              onSurface: Color(0xff4A3428),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedTime.value = picked;
    }
  }

  void selectLocation(String location) {
    selectedLocation.value = location;
  }

  void generateAiSummary() {
    isGeneratingAiSummary.value = true;
    Future.delayed(const Duration(milliseconds: 1500), () {
      final category = selectedCategory.value;
      final timeStr = "${hours.value > 0 ? '${hours.value}h ' : ''}${minutes.value}m";
      final rpe = intensity.value.round();
      final tagList = tags.join(', ');

      aiSummaryText.value =
          "Grovr AI Analysis:\n\nBased on your $timeStr $category workout "
          "${tagList.isNotEmpty ? '($tagList) ' : ''}at an RPE of $rpe/10:\n\n"
          "• Muscle Demand: Focus on correct form during heavy compound movement.\n"
          "• Calorie Burn Estimate: ~${(minutes.value * 7.5).round()} kcal.\n"
          "• Recommendation: Maintain proper hydration. Since effort was logged at $rpe/10, "
          "we recommend 24-48 hours of recovery before training the same targeted muscle group.";
      isGeneratingAiSummary.value = false;
    });
  }

  void logExercise() {
    // Show success snackbar
    Get.snackbar(
      'Exercise Logged',
      'Your workout has been logged successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );

    // Go back to the Home screen tab
    Get.find<BottomNavController>().changeIndex(0);
  }

  @override
  void onClose() {
    descriptionController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
