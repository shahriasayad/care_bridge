import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/controller/user_profile_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/user_profile_info/controller/user_profile_controller.dart';

class UserProfileInformationScreen extends StatelessWidget {
  const UserProfileInformationScreen({super.key});

  Widget _buildFieldLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: getTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSelection(UserProfileInfoController controller) {
    final genders = ['Male', 'Female', 'Other', 'Prefer not to say'];
    return Obx(() {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: genders.map((gender) {
          final isSelected = controller.selectedGender.value == gender;
          return GestureDetector(
            onTap: () => controller.selectedGender.value = gender,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.iconColor
                    : const Color(0xFFFAF2EC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                gender,
                style: getTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : AppColors.secondaryTextColor,
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileInfoController());
    final mainController = Get.isRegistered<UserProfileController>()
        ? Get.find<UserProfileController>()
        : null;

    final user = mainController?.user.value;
    final ImageProvider avatarProvider = (user?.avatarUrl != null)
        ? AssetImage(user!.avatarUrl!)
        : const AssetImage(IconPath.userProfileIcon2);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(
                  title: 'Profile Information',
                  showBackButton: true,
                  showNotificationButton: false,
                ),
                const SizedBox(height: 32),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              AppColors.circularProgressIndicatorColor,
                          backgroundImage: avatarProvider,
                        ),
                      ),
                      Positioned(
                        bottom: -6,
                        right: 12,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.primaryGraphColor,
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Full Name
                _buildFieldLabel('Full Name'),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.nameController,
                  style: getTextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.borderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.borderColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Date of Birth
                _buildFieldLabel('Date of Birth'),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.dobController,
                  readOnly: true,
                  onTap: () => controller.selectDate(context),
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Select date of birth',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.borderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.borderColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Gender
                _buildFieldLabel('Gender'),
                const SizedBox(height: 8),
                _buildGenderSelection(controller),
                const SizedBox(height: 24),
                // Email Address
                _buildFieldLabel('Email Address'),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: getTextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.borderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.borderColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Phone Number
                _buildFieldLabel('Phone Number'),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFDF9F6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('🇧🇩', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 6),
                            Text(
                              '+880',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.secondaryTextColor,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 1,
                        color: AppColors.borderColor,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.phoneController,
                          keyboardType: TextInputType.phone,
                          style: getTextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: getTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'Update Profile',
                  onTap: controller.updateProfile,
                  backgroundColor: AppColors.primaryButtonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
