class ProviderProfileModel {
  final String name;
  final String email;
  final String? avatarUrl;

  const ProviderProfileModel({
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  factory ProviderProfileModel.fromJson(Map<String, dynamic> json) =>
      ProviderProfileModel(
        name: json['name'] as String,
        email: json['email'] as String,
        avatarUrl: json['avatarUrl'] as String?,
      );

  ProviderProfileModel copyWith({
    String? name,
    String? email,
    String? avatarUrl,
  }) {
    return ProviderProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}

class ProviderProfileMenuItem {
  final String title;
  final String route;

  const ProviderProfileMenuItem({required this.title, required this.route});
}
