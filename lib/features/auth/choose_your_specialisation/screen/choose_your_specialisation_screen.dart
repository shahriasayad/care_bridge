import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/auth/choose_your_specialisation/controller/choose_your_specialisation_controller.dart';
import 'package:care_bridge/features/auth/choose_your_specialisation/widget/file_upload_widget.dart';
import 'package:care_bridge/features/auth/choose_your_specialisation/widget/select_specialization_widget.dart';
import 'package:care_bridge/features/auth/forget/screen/success_screen.dart';
import 'package:care_bridge/features/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:care_bridge/features/bottom_nav/screen/bottom_nav_screen.dart';

class ChooseYourSpecialisationScreen extends StatelessWidget {
  const ChooseYourSpecialisationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChooseYourSpecialisationController controller = Get.put(
      ChooseYourSpecialisationController(),
    );
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 16,
                  right: 16,
                  bottom: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Setup',
                      style: getTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fill out the form',
                      style: getTextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Avatar
                    Center(
                      child: Obx(
                        () => Stack(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey[300],
                              backgroundImage:
                                  controller.selectedImage.value != null
                                  ? FileImage(controller.selectedImage.value!)
                                  : const AssetImage(IconPath.user)
                                        as ImageProvider,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: controller.pickImage,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryButtonColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Select Specialization
                    SelectSpecializationWidget(),
                    const SizedBox(height: 24),

                    // Location
                    CustomTextFormField(
                      label: 'Location',
                      isRequired: true,
                      hintText: 'Enter location',
                      controller: controller.locationController,
                    ),
                    const SizedBox(height: 24),

                    // Description
                    CustomTextFormField(
                      label: 'Description',
                      isRequired: true,
                      hintText: 'Write description...',
                      controller: controller.descriptionController,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 24),

                    // Driver License
                    Obx(
                      () => FileUploadWidget(
                        label: 'Driver License',
                        isRequired: true,
                        selectedFile: controller.driverLicense.value,
                        onUpload: controller.pickDriverLicense,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Certificate
                    Obx(
                      () => FileUploadWidget(
                        label: 'Certificate',
                        isRequired: true,
                        selectedFile: controller.certificate.value,
                        onUpload: controller.pickCertificate,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Government Issued Id
                    Obx(
                      () => FileUploadWidget(
                        label: 'Government Issued Id',
                        isRequired: true,
                        selectedFile: controller.governmentId.value,
                        onUpload: controller.pickGovernmentId,
                      ),
                    ),
                   // const SizedBox(height: 24),

                    // Marketplace Insurance
                    // Obx(
                    //   () => FileUploadWidget(
                    //     label: 'Marketplace insurance',
                    //     isRequired: true,
                    //     selectedFile: controller.marketplaceInsurance.value,
                    //     onUpload: controller.pickMarketplaceInsurance,
                    //   ),
                    // ),
                    const SizedBox(height: 24),

                    // Additional Certifications
                    Obx(
                      () => FileUploadWidget(
                        label: 'Additional Certifications',
                        isRequired: true,
                        selectedFile: controller.additionalCertifications.value,
                        onUpload: controller.pickAdditionalCertifications,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Fixed bottom button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: CustomButton(
                text: 'Create Account',
                onTap: () {
                  Get.offAll(
                    SuccessScreen(
                      message:
                          'Your Account has been created successfully. Let\'s get started.',
                      buttonText: 'Let\'s Go',
                      onTap: () {
                        Get.off(
                          () => BottomNavScreen(),
                          binding: BottomNavBinding(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
