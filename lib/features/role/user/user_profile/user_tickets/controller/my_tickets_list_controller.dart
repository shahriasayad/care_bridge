import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_tickets/model/user_ticket_model.dart';

class MyTicketsListController extends GetxController {
  final selectedTab = 0.obs;

  final allTickets = <MyTicketItemModel>[
    const MyTicketItemModel(
      id: '#TK-1246',
      category: 'Bllling',
      description: 'Double charged this month',
      lastUpdate: 'May 29, 2005',
      status: 'In Progress',
    ),
    const MyTicketItemModel(
      id: '#TK-1246',
      category: 'Bllling',
      description: 'Double charged this month',
      lastUpdate: 'May 29, 2005',
      status: 'Open',
    ),
    const MyTicketItemModel(
      id: '#TK-1246',
      category: 'Bllling',
      description: 'Double charged this month',
      lastUpdate: 'May 29, 2005',
      status: 'Resolved',
    ),
  ].obs;

  void selectTab(int index) {
    selectedTab.value = index;
  }

  List<MyTicketItemModel> get filteredTickets {
    if (selectedTab.value == 0) {
      // Return all tickets to match screenshot behavior exactly
      return allTickets;
    } else if (selectedTab.value == 1) {
      return allTickets.where((t) => t.status == 'In Progress').toList();
    } else if (selectedTab.value == 2) {
      return allTickets.where((t) => t.status == 'Resolved').toList();
    } else {
      return allTickets.where((t) => t.status == 'Closed').toList();
    }
  }
}
