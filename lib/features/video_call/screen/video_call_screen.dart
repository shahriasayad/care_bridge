import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/video_call/controller/video_call_controller.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoCallController());
    final args = Get.arguments as Map<String, dynamic>?;
    
    final String userName = args?['userName'] ?? 'Dr. Sarah Chen';
    final String userAvatar = args?['userAvatar'] ?? IconPath.user;

    return Scaffold(
      body: Stack(
        children: [
          // Full Screen Doctor Waving Background
          Positioned.fill(
            child: Image.asset(
              IconPath.videoCallBackground,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFFDF9F6),
                  child: const Center(
                    child: Icon(
                      Icons.videocam,
                      size: 64,
                      color: AppColors.primaryGraphColor,
                    ),
                  ),
                );
              },
            ),
          ),

          // Calling Info - Top-Left (only shown if call is not accepted)
          Positioned(
            top: 60,
            left: 20,
            child: Obx(() {
              if (controller.isCallAccepted.value) {
                return const SizedBox.shrink();
              }
              return Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        userAvatar,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 56,
                            height: 56,
                            color: Colors.white,
                            child: const Icon(Icons.person, size: 36),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: getTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Calling....',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),

          // Patient self-view inset - Top-Right (only shown when call is accepted)
          Positioned(
            top: 60,
            right: 20,
            child: Obx(() {
              if (!controller.isCallAccepted.value) {
                return const SizedBox.shrink();
              }
              return Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    IconPath.videoCallPatientSelf,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.person, size: 40),
                      );
                    },
                  ),
                ),
              );
            }),
          ),

          // Bottom Action Buttons
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Obx(() {
              if (!controller.isCallAccepted.value) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Accept call button (Green phone receiver - no solid background circle)
                    GestureDetector(
                      onTap: controller.acceptCall,
                      child: Container(
                        width: 64,
                        height: 64,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.call,
                          color: AppColors.completedColor,
                          size: 64,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Reject call button (Red close X in solid circle)
                    GestureDetector(
                      onTap: controller.declineCall,
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          color: AppColors.cancelledColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  // End call button (Red close X in solid circle)
                  child: GestureDetector(
                    onTap: controller.endCall,
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: AppColors.cancelledColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
