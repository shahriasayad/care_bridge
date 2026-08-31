import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/controller/my_tickets_list_controller.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/model/user_ticket_model.dart';
import 'package:care_bridge/routes/app_routes.dart';

class MyTicketsListScreen extends StatelessWidget {
  const MyTicketsListScreen({super.key});

  Widget _buildTabItem(
    int index,
    String label,
    bool isSelected,
    MyTicketsListController controller,
  ) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => controller.selectTab(index),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                label,
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? AppColors.iconColor
                      : AppColors.secondaryTextColor,
                ),
              ),
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: isSelected ? AppColors.iconColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard(MyTicketItemModel ticket) {
    Color statusColor;
    String statusText;

    if (ticket.status == 'In Progress') {
      statusColor = const Color(0xFF1D61E7); // blue
      statusText = 'in Progres';
    } else if (ticket.status == 'Open') {
      statusColor = const Color(0xFFE67E22); // orange
      statusText = 'Open';
    } else {
      statusColor = const Color(0xFF16A34A); // green
      statusText = 'Resolved';
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF6EE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ticket.id,
                style: getTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  statusText,
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '${ticket.category} - ${ticket.description}',
            style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Last update: ${ticket.lastUpdate}',
            style: getTextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyTicketsListController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.getUserTicketsScreen()),
        backgroundColor: AppColors.iconColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: CustomAppBar(
                title: 'My Tickets',
                showBackButton: true,
                showNotificationButton: false,
              ),
            ),
            const SizedBox(height: 10),
            Obx(() {
              final activeTab = controller.selectedTab.value;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    _buildTabItem(0, 'Open', activeTab == 0, controller),
                    _buildTabItem(1, 'In Progress', activeTab == 1, controller),
                    _buildTabItem(2, 'Resolved', activeTab == 2, controller),
                    _buildTabItem(3, 'Closed', activeTab == 3, controller),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                final list = controller.filteredTickets;
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      'No tickets found',
                      style: getTextStyle(
                        fontSize: 16,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return _buildTicketCard(list[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
