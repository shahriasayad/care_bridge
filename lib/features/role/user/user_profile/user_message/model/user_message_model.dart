class UserMessageModel {
  final String id;
  final String senderName;
  final String? avatarUrl;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;

  const UserMessageModel({
    required this.id,
    required this.senderName,
    required this.lastMessage,
    required this.time,
    this.avatarUrl,
    this.unreadCount = 0,
    this.isOnline = false,
  });

  factory UserMessageModel.fromJson(Map<String, dynamic> json) =>
      UserMessageModel(
        id: json['id'] as String,
        senderName: json['senderName'] as String,
        lastMessage: json['lastMessage'] as String,
        time: json['time'] as String,
        avatarUrl: json['avatarUrl'] as String?,
        unreadCount: json['unreadCount'] as int? ?? 0,
        isOnline: json['isOnline'] as bool? ?? false,
      );
}