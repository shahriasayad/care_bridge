import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/features/role/user/user_profile/user_help_support/model/user_help_support_model.dart';
import 'package:care_bridge/routes/app_routes.dart';

class UserHelpSupportController extends GetxController {
  final searchQuery = ''.obs;

  final categories = <UserHelpSupportCategoryModel>[
    const UserHelpSupportCategoryModel(
      title: 'Bill & Payments',
      description: 'Questions about changes ,refunds ,invoices',
      icon: Icons.receipt_long_outlined,
      iconColor: Color(0xFFE67E22),
      iconBgColor: Color(0xFFFDF2E9),
    ),
    const UserHelpSupportCategoryModel(
      title: 'Account Issues',
      description: 'Login,profile,security and verifications',
      icon: Icons.person_outline_rounded,
      iconColor: Color(0xFF2980B9),
      iconBgColor: Color(0xFFEBF5FB),
    ),
    const UserHelpSupportCategoryModel(
      title: 'Provider Issues',
      description: 'Problems with providers or appointments',
      icon: Icons.person_outline_rounded,
      iconColor: Color(0xFF2980B9),
      iconBgColor: Color(0xFFEBF5FB),
    ),
    const UserHelpSupportCategoryModel(
      title: 'AI Coach Issues',
      description: 'AI responses, accuracy or behavior',
      icon: Icons.person_outline_rounded,
      iconColor: Color(0xFF2980B9),
      iconBgColor: Color(0xFFEBF5FB),
    ),
    const UserHelpSupportCategoryModel(
      title: 'Technical Issues',
      description: 'App errors, performance ,or bugs',
      icon: Icons.settings_suggest_outlined,
      iconColor: Color(0xFF1ABC9C),
      iconBgColor: Color(0xFFE8F8F5),
    ),
    const UserHelpSupportCategoryModel(
      title: 'Other',
      description: 'Something else not issues above',
      icon: Icons.chat_bubble_outline_rounded,
      iconColor: Color(0xFF2ECC71),
      iconBgColor: Color(0xFFE8F8F5),
    ),
  ].obs;

  List<UserHelpSupportCategoryModel> get filteredCategories {
    if (searchQuery.value.isEmpty) return categories;
    return categories
        .where((c) =>
            c.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
            c.description.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void onSearchChanged(String val) {
    searchQuery.value = val;
  }

  void selectCategory(UserHelpSupportCategoryModel category) {
    Get.toNamed(
      AppRoutes.getUserTicketsScreen(),
      arguments: category.title,
    );
  }
}
