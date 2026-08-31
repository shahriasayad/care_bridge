import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/user/user_track/controller/user_track_meal_controller.dart';
import 'package:care_bridge/features/role/user/user_track/widgets/user_dashed_border_painter_widget.dart';

class UserCameraTabWidget extends StatelessWidget {
  UserCameraTabWidget({super.key});

  final UserTrackMealController controller =
      Get.find<UserTrackMealController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _showImageSourceDialog(context);
        },
        child: Container(
          width: double.infinity,
          height: 252,
          decoration: BoxDecoration(
            color: AppColors.scoreCardBackgroundColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.scoreCardBackgroundColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            image: controller.pickedImage.value != null
                ? DecorationImage(
                    image: FileImage(controller.pickedImage.value!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: controller.pickedImage.value != null
              ? Stack(
                  children: [
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: CustomButton(
                        text: 'Upload',

                        onTap: () {
                          controller.uploadImage();
                        },
                      ),
                    ),
                  ],
                )
              : UserDashedBorderPainterWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          color: AppColors.iconBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            IconPath.cameraIcon,
                            color: AppColors.iconColor,
                            width: 26,
                            height: 26,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Tap to take a photo of your meal',
                        style: getTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text('Camera', style: getTextStyle()),
              onTap: () {
                Navigator.pop(context);
                controller.pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                controller.pickImage(ImageSource.gallery);
              },
            ),
            if (controller.pickedImage.value != null)
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text(
                  'Remove Image',
                  style: getTextStyle(color: Colors.red),
                ),
                onTap: () {
                  Get.back();
                  controller.pickedImage.value = null;
                },
              ),
          ],
        ),
      ),
    );
  }
}
