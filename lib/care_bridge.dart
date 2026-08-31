import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/binding/role_binding.dart';
import 'package:care_bridge/routes/app_routes.dart';

class CareBridge extends StatelessWidget {
  const CareBridge({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.getSplashScreen(),
      initialBinding: RoleBinding(),
      getPages: AppRoutes.routes,
      builder: EasyLoading.init(),
      themeMode: ThemeMode.light,
    );
  }
}
