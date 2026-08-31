class UserChangePasswordModel {
  final String currentPassword;
  final String newPassword;

  const UserChangePasswordModel({
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() => {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };
}