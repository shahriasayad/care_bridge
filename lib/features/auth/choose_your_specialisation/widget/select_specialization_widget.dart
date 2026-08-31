import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/auth/choose_your_specialisation/controller/choose_your_specialisation_controller.dart';

class SelectSpecializationWidget extends StatelessWidget {
  SelectSpecializationWidget({super.key});

  final ChooseYourSpecialisationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Select Specialization',
                style: getTextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        Obx(
          () => SizedBox(
            height: 48,
            child: DropdownButtonFormField<String>(
              initialValue: controller.selectedSpecialization.value.isEmpty
                  ? null
                  : controller.selectedSpecialization.value,

              decoration: InputDecoration(
                hintText: 'Select Specialisation',

                hintStyle: const TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFEBE9E8),
                    width: 1,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFEBE9E8),
                    width: 1,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),

                isDense: true,
                filled: false,
              ),

              style: const TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 16,
                height: 1.3,
              ),

              dropdownColor: Colors.white,

              icon: const Icon(Icons.keyboard_arrow_down),

              items: const [
                DropdownMenuItem(
                  value: 'Neurologist',
                  child: Text('Neurologist'),
                ),

                DropdownMenuItem(
                  value: 'Rheumatologist',
                  child: Text('Rheumatologist'),
                ),

                DropdownMenuItem(
                  value: 'Cardiologist',
                  child: Text('Cardiologist'),
                ),
              ],

              onChanged: (value) {
                if (value != null) {
                  controller.setSpecialization(value);
                }
              },

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select specialisation';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
