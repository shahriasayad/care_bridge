import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/core/const/icon_path.dart';
import 'package:care_bridge/features/role/provider/message/message_details/screen/message_details_screen.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/controller/user_provider_details_controller.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_add_review_bottom_sheet.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_provider_about_section.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_provider_header.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_provider_insurance_card.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_provider_profile_info.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_provider_review_card.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_provider_service_card.dart';
import 'package:care_bridge/features/role/user/user_services/user_provider_details/widgets/user_provider_tabs.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserProviderDetailsScreen extends StatelessWidget {
  const UserProviderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserProviderDetailsController>();
    final provider = controller.provider;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserProviderHeader(provider: provider),
            const SizedBox(height: 50),
            UserProviderProfileInfo(provider: provider),
            const SizedBox(height: 24),
            _buildChatButton(controller),
            UserProviderAboutSection(about: provider.about),
            const SizedBox(height: 32),
            UserProviderTabs(controller: controller),
            const SizedBox(height: 24),
            _buildTabContent(controller),
            const SizedBox(height: 32),
            _buildActionButton(controller),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildChatButton(UserProviderDetailsController controller) {
    return Column(
      children: [
       GestureDetector(
  onTap: () {
    Get.to(
  () => MessageDetailsScreen(
    userName: controller.provider.name ,
    userAvatar: controller.provider.image,
  ),
);
  },
  child: Container(
    height: 48,
    width: 48,
    decoration: const BoxDecoration(
      color: Color(0xFFE6D7CD),
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Image.asset(
        IconPath.messageIcon,
        width: 22,
        height: 22,
      ),
    ),
  ),
),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTabContent(UserProviderDetailsController controller) {
    final provider = controller.provider;
    return Obx(() {
      if (controller.selectedTab.value == 0) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: provider.services.length,
          itemBuilder: (context, index) {
            return UserProviderServiceCard(
              controller: controller,
              index: index,
              service: provider.services[index],
            );
          },
        );
      } else if (controller.selectedTab.value == 1) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: provider.insurances.length,
          itemBuilder: (context, index) {
            return UserProviderInsuranceCard(
              insurance: provider.insurances[index],
            );
          },
        );
      } else {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () =>
                        UserAddReviewBottomSheet.show(Get.context!, controller),
                    child: Text(
                      '+ Add Review',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Overall Rating Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Rating Score
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overall Rating',
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '4.8',
                        style: getTextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 18,
                          );
                        }),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '(1,248 reviews)',
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 32),
                  // Right Rating breakdown progress bars
                  Expanded(
                    child: Column(
                      children: [
                        _buildRatingProgressRow(5, 0.85, '85%'),
                        const SizedBox(height: 8),
                        _buildRatingProgressRow(4, 0.10, '10%'),
                        const SizedBox(height: 8),
                        _buildRatingProgressRow(3, 0.03, '3%'),
                        const SizedBox(height: 8),
                        _buildRatingProgressRow(2, 0.01, '1%'),
                        const SizedBox(height: 8),
                        _buildRatingProgressRow(1, 0.01, '1%'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Stats Row Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.iconBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem(
                      icon: Icons.thumb_up_alt_outlined,
                      value: '98%',
                      label: 'Patients recommend',
                    ),
                    _buildStatItem(
                      icon: Icons.chat_bubble_outline_rounded,
                      value: '1.2K',
                      label: 'Total Review',
                    ),
                    _buildStatItem(
                      icon: Icons.favorite_border_rounded,
                      value: '4.8',
                      label: 'Avg Care exp',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: provider.reviewList.length,
              itemBuilder: (context, index) {
                return UserProviderReviewCard(
                  review: provider.reviewList[index],
                );
              },
            ),
          ],
        );
      }
    });
  }

  Widget _buildActionButton(UserProviderDetailsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        text: 'Book Appointment',
        onTap: () {
          Get.toNamed(
            AppRoutes.userBookingScreen,
            arguments: controller.provider,
          );
        },
      ),
    );
  }

  Widget _buildRatingProgressRow(int stars, double factor, String percentageText) {
    return Row(
      children: [
        Text(
          '$stars',
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: factor,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.providerCardBackgroundColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          percentageText,
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
              color: Color(0xFFE6D7CD),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.iconColor,
              size: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
