class ServiceModel {
  final String id;
  final String title;
  final double price;
  final String duration;

  ServiceModel({
    required this.id,
    required this.title,
    required this.price,
    required this.duration,
  });

  ServiceModel copyWith({
    String? id,
    String? title,
    double? price,
    String? duration,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      duration: duration ?? this.duration,
    );
  }
}
