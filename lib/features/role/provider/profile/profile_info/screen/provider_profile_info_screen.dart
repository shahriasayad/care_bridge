import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/common/widgets/custom_text_form_field.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/profile/profile_info/controller/provider_profile_info_controller.dart';
import 'package:care_bridge/features/role/provider/profile/profile_info/widgets/day_availability_tile.dart';

class ProviderProfileInfoScreen extends StatelessWidget {
  const ProviderProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderProfileInfoController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAppBar(
                title: 'Profile Information',
                showBackButton: true,
                showNotificationButton: false,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Avatar block
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Obx(() {
                              final imageFile = controller.selectedImage.value;
                              return CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    AppColors.scoreCardBackgroundColor,
                                backgroundImage: imageFile != null
                                    ? FileImage(imageFile)
                                    : const AssetImage(
                                        IconPath.userProfileIcon2,
                                      ) as ImageProvider,
                              );
                            }),
                            Positioned(
                              bottom: -13,
                              right: 36,
                              child: GestureDetector(
                                onTap: controller.onEditAvatar,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.iconColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 39),

                      // Form Fields
                      CustomTextFormField(
                        label: "Full Name",
                        isRequired: true,
                        controller: controller.nameController,
                        hintText: "Enter your full name",
                      ),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        label: 'Email',
                        hintText: 'Enter your email',
                        isRequired: true,
                        controller: controller.emailController,
                        //validator: (value) => controller.validateEmail(value),
                      ),
                      SizedBox(height: 24),

                      CustomTextFormField(
                        label: "Location",
                        isRequired: true,
                        controller: controller.locationController,
                        hintText: 'Enter location',
                      ),
                      const SizedBox(height: 24),

                      CustomTextFormField(
                        maxLines: 4,
                        label: "Description",
                        isRequired: true,
                        controller: controller.descriptionController,
                        hintText: "Write description...",
                      ),
                      const SizedBox(height: 24),

                      // Availability Schedule List
                      Obx(
                        () => Column(
                          children: List.generate(
                            controller.availabilities.length,
                            (index) {
                              final availability =
                                  controller.availabilities[index];
                              return DayAvailabilityTile(
                                availability: availability,
                                timeSlots: controller.timeSlots,
                                onToggle: (val) =>
                                    controller.toggleAvailability(index, val),
                                onFromChanged: (val) =>
                                    controller.updateFromTime(index, val),
                                onToChanged: (val) =>
                                    controller.updateToTime(index, val),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Update Profile',
                onTap: controller.updateProfile,
                backgroundColor: AppColors.primaryButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
