class UserTicketModel {
  final String subject;
  final String description;
  final String preferredContactMethod;
  final List<String> attachments;

  const UserTicketModel({
    required this.subject,
    required this.description,
    required this.preferredContactMethod,
    required this.attachments,
  });
}

class MyTicketItemModel {
  final String id;
  final String category;
  final String description;
  final String lastUpdate;
  final String status;

  const MyTicketItemModel({
    required this.id,
    required this.category,
    required this.description,
    required this.lastUpdate,
    required this.status,
  });
}
