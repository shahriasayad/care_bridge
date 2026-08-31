class DayAvailability {
  final String dayName;
  final bool isAvailable;
  final String? fromTime;
  final String? toTime;

  const DayAvailability({
    required this.dayName,
    required this.isAvailable,
    this.fromTime,
    this.toTime,
  });

  DayAvailability copyWith({
    String? dayName,
    bool? isAvailable,
    String? fromTime,
    String? toTime,
  }) {
    return DayAvailability(
      dayName: dayName ?? this.dayName,
      isAvailable: isAvailable ?? this.isAvailable,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
    );
  }
}

class ProviderProfileInfoModel {
  final String name;
  final String email;
  final String location;
  final String description;
  final List<DayAvailability> availabilities;

  const ProviderProfileInfoModel({
    required this.name,
    required this.email,
    required this.location,
    required this.description,
    required this.availabilities,
  });

  ProviderProfileInfoModel copyWith({
    String? name,
    String? email,
    String? location,
    String? description,
    List<DayAvailability>? availabilities,
  }) {
    return ProviderProfileInfoModel(
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
      description: description ?? this.description,
      availabilities: availabilities ?? this.availabilities,
    );
  }
}
