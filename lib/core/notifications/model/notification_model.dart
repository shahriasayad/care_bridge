class NotificationModel {
  final String id;
  final String message;
  final String dateTime;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.message,
    required this.dateTime,
    this.isRead = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id']?.toString() ?? '',
      message: json['message'] ?? '',
      dateTime: json['dateTime'] ?? '',
      isRead: json['isRead'] ?? false,
    );
  }
}
