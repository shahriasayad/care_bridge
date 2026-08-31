import 'package:get/get.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/image_path.dart';
import 'package:care_bridge/features/role/user/user_profile/profile/model/user_profile_model.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserProfileController extends GetxController {
  final Rx<UserProfileModel> user = const UserProfileModel(
    name: 'David William',
    email: 'david.william@email.com',
    avatarUrl: ImagePath.profile6,
  ).obs;

  final List<ProfileMenuItem> menuItems = [
    const ProfileMenuItem(title: 'Profile Information', route: '/profile-info'),
    const ProfileMenuItem(title: 'Payment Methods',     route: '/payment-methods'),
    const ProfileMenuItem(title: 'Subscription',        route: '/subscription'),
    ProfileMenuItem(title: 'My Appointments',     route: AppRoutes.userAppointmentsScreen),
    const ProfileMenuItem(title: 'Change Password',     route: '/change-password'),
    const ProfileMenuItem(title: 'Message',             route: '/message'),
    const ProfileMenuItem(title: 'App Review',          route: '/app-review'),
    ProfileMenuItem(title: 'Help & Support',      route: AppRoutes.userHelpSupportScreen),
    ProfileMenuItem(title: 'My Tickets',          route: AppRoutes.myTicketsListScreen),
    const ProfileMenuItem(title: 'Log Out',             route: '/logout'),
  ];

  void onMenuTap(ProfileMenuItem item) {
    if (item.route == '/logout') {
      _handleLogout();
      return;
    }
    if (item.route == '/app-review') {
      Get.snackbar(
        'Info',
        '${item.title} is coming soon!',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    Get.toNamed(item.route);
  }

  void onNotificationTap() => Get.toNamed('/notifications');

  void onEditAvatar() => Get.toNamed('/edit-avatar');

  void onDeleteAccount() {
    Get.defaultDialog(
      backgroundColor: AppColors.iconBackground,
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account? This action cannot be undone.',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      onConfirm: _confirmDelete,
    );
  }

  void _handleLogout() {
    Get.defaultDialog(
      backgroundColor: AppColors.iconBackground,
      title: 'Log Out',
      middleText: 'Are you sure you want to log out?',
      textConfirm: 'Log Out',
      textCancel: 'Cancel',
      onConfirm: () => Get.offAllNamed('/loginScreen'),
    );
  }

  void _confirmDelete() {
    Get.offAllNamed('/loginScreen');
  }
}