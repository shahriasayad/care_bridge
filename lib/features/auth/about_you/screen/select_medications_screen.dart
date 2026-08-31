import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/auth/about_you/controller/select_medications_controller.dart';

class SelectMedicationsScreen extends StatelessWidget {
  const SelectMedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectMedicationsController());

    final List<String> medications = [
      'None',
      'Multivitamin',
      'Protein Supplements',
      'Creatine',
      'Omega-3',
      'Others',
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.iconBackground,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: AppColors.primaryTextColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Text(
                    "About You",
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 40), // Spacing placeholder for symmetry
                ],
              ),
              const SizedBox(height: 20),
              // Horizontal Step Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const LinearProgressIndicator(
                  value: 0.5,
                  minHeight: 4,
                  backgroundColor: AppColors.borderColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.iconColor,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              // Screen Main Title
              Text(
                "Are you currently taking\nany medications or\nSupplements?",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              // Screen Subtitle
              Text(
                "Select all that apply",
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 24),
              // Multi-select Medications List
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: medications.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final med = medications[index];

                    return Obx(() {
                      final isSelected = controller.isSelected(med);
                      return GestureDetector(
                        onTap: () => controller.toggleMedication(med),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.iconColor
                                  : AppColors.borderColor,
                              width: isSelected ? 1.5 : 1.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Medication Text Label
                              Expanded(
                                child: Text(
                                  med,
                                  style: getTextStyle(
                                    fontSize: 20,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ),
                              // Right Checkmark Icon
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: AppColors.iconColor,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Bottom Continue Button
              CustomButton(text: "Continue", onTap: controller.continueToNext),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
