import 'package:get/get.dart';
import 'package:care_bridge/core/notifications/model/notification_model.dart';

class NotificationsController extends GetxController {
  final notifications = <NotificationModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  /// Replace with real API call when backend is ready.
  /// Ex :
  ///   final response = await ApiService.get(urls.notifications);
  ///   notifications.value = (response as List)
  ///       .map((e) => NotificationModel.fromJson(e))
  ///       .toList();
  Future<void> fetchNotifications() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await Future.delayed(const Duration(milliseconds: 300));
      notifications.value = _mockNotifications();
    } catch (e) {
      errorMessage.value = 'Failed to load notifications.';
    } finally {
      isLoading.value = false;
    }
  }

  List<NotificationModel> _mockNotifications() => [
    NotificationModel(
      id: '1',
      message:
          'You have got new appointment for general consultation with Alex john',
      dateTime: 'Feb 12, 2025 10:00 AM',
    ),
    NotificationModel(
      id: '2',
      message:
          'You have got new appointment for general consultation with Alex john has been completed',
      dateTime: 'Feb 12, 2025 10:00 AM',
      isRead: true,
    ),
    NotificationModel(
      id: '3',
      message:
          'Your sleep report for last week is ready. Tap to view your insights.',
      dateTime: 'Feb 11, 2025 9:00 AM',
    ),
    NotificationModel(
      id: '4',
      message:
          'Reminder: Log your meals today to keep your health score on track.',
      dateTime: 'Feb 10, 2025 8:30 AM',
      isRead: true,
    ),
  ];
}
