import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/controller/user_tickets_controller.dart';

class UserTicketsScreen extends StatelessWidget {
  const UserTicketsScreen({super.key});

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: getTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
      ),
    );
  }

  Widget _buildRadioButton(
    String value,
    String currentSelected,
    VoidCallback onTap,
  ) {
    final isSelected = value == currentSelected;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppColors.iconColor
                    : AppColors.secondaryTextColor.withOpacity(0.5),
                width: 2,
              ),
              color: Colors.white,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconColor,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserTicketsController());

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
                  title: 'Submit a Ticket',
                  showBackButton: true,
                  showNotificationButton: false,
                ),
                const SizedBox(height: 32),

                // Subject
                _buildFieldLabel('Subject'),
                TextField(
                  controller: controller.subjectController,
                  style: getTextStyle(fontSize: 14),
                  decoration: InputDecoration(
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

                // Description
                _buildFieldLabel('Description'),
                TextField(
                  controller: controller.descriptionController,
                  maxLines: 5,
                  style: getTextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'message',
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

                // Attachments
                _buildFieldLabel('Attachments (optional)'),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: controller.addAttachment,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAF2EC),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Add a screenshot or file',
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'JPG,PNG,PDF max 10MB',
                          style: getTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.attachments.isEmpty)
                    return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(controller.attachments.length, (
                        index,
                      ) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.attachments[index],
                                style: getTextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () => controller.removeAttachment(index),
                                child: const Icon(
                                  Icons.cancel,
                                  size: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                }),
                const SizedBox(height: 24),

                // Preferred Contact Method
                _buildFieldLabel('Preferred contact method'),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Obx(() {
                    final selected = controller.preferredContactMethod.value;
                    return Row(
                      children: [
                        Expanded(
                          child: _buildRadioButton(
                            'Email',
                            selected,
                            () => controller.selectContactMethod('Email'),
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 1,
                          color: AppColors.tertiaryTextColor2,
                        ),
                        Expanded(
                          child: _buildRadioButton(
                            'Phone',
                            selected,
                            () => controller.selectContactMethod('Phone'),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 48),

                // Submit Button
                Obx(() {
                  return CustomButton(
                    text: controller.isLoading.value
                        ? 'Submitting...'
                        : 'Submit Ticket',
                    onTap: controller.isLoading.value
                        ? null
                        : controller.submitTicket,
                  );
                }),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
