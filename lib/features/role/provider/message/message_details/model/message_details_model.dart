class MessageDetailsModel {
  final String id;
  final String senderId;
  final String? text;
  final String? imageUrl;
  final String? imageFilePath;
  final DateTime timestamp;
  final bool isSentByMe;

  const MessageDetailsModel({
    required this.id,
    required this.senderId,
    this.text,
    this.imageUrl,
    this.imageFilePath,
    required this.timestamp,
    required this.isSentByMe,
  });

  factory MessageDetailsModel.fromJson(Map<String, dynamic> json) =>
      MessageDetailsModel(
        id: json['id'] as String,
        senderId: json['senderId'] as String,
        text: json['text'] as String?,
        imageUrl: json['imageUrl'] as String?,
        imageFilePath: json['imageFilePath'] as String?,
        timestamp: DateTime.parse(json['timestamp'] as String),
        isSentByMe: json['isSentByMe'] as bool,
      );
}
