import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/features/role/provider/profile/profile_main/model/provider_profile_model.dart';
import 'package:care_bridge/routes/app_routes.dart';

class ProviderProfileController extends GetxController {
  final Rx<ProviderProfileModel> user = const ProviderProfileModel(
    name: 'Dr Sarah Chen',
    email: 'david.william@email.com',
    avatarUrl: null,
  ).obs;

  final ImagePicker _picker = ImagePicker();

  final List<ProviderProfileMenuItem> menuItems = const [
    ProviderProfileMenuItem(
      title: 'Profile Information',
      route: '/profile-info',
    ),
    ProviderProfileMenuItem(
      title: 'Change Password',
      route: '/change-password',
    ),
    ProviderProfileMenuItem(title: 'Subscription', route: '/Subscription'),
    ProviderProfileMenuItem(title: 'App Review', route: '/app-review'),
    ProviderProfileMenuItem(title: 'Log Out', route: '/logout'),
  ];

  void onMenuTap(ProviderProfileMenuItem item) {
    if (item.route == '/logout') {
      _handleLogout();
      return;
    }
    if (item.route == '/profile-info') {
      Get.toNamed(AppRoutes.getProviderProfileInformationScreen());
      return;
    }
    if (item.route == '/change-password') {
      Get.toNamed(AppRoutes.getProviderChangePasswordScreen());
      return;
    }
    if (item.route == '/Subscription') {
      Get.toNamed(AppRoutes.getProviderSubscriptionScreen());
      return;
    }
    EasyLoading.showToast('Navigating to ${item.title}');
  }

  void onNotificationTap() => Get.toNamed('/notificationsScreen');

  Future<void> onEditAvatar() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      user.value = user.value.copyWith(avatarUrl: image.path);
      EasyLoading.showToast('Avatar updated');
    }
  }

  void onDeleteAccount() {
    Get.defaultDialog(
      backgroundColor: AppColors.iconBackground,
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account? This action cannot be undone.',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      onConfirm: _confirmDelete,
      confirmTextColor: AppColors.cancelledColor,
      cancelTextColor: AppColors.secondaryTextColor,
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
      confirmTextColor: AppColors.primaryTextColor,
      cancelTextColor: AppColors.secondaryTextColor,
    );
  }

  void _confirmDelete() {
    Get.offAllNamed('/loginScreen');
  }
}
