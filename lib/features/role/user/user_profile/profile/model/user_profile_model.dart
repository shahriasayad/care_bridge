class UserProfileModel {
  final String name;
  final String email;
  final String? avatarUrl;

  const UserProfileModel({
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        name: json['name'] as String,
        email: json['email'] as String,
        avatarUrl: json['avatarUrl'] as String?,
      );
}

class ProfileMenuItem {
  final String title;
  final String route;

  const ProfileMenuItem({required this.title, required this.route});
}