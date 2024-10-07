import 'package:ecom_project_using_rest_api/controller_bindings.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/splash_screen.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/utlity/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
      initialBinding: ControllerBindings(),
    );
  }
}
