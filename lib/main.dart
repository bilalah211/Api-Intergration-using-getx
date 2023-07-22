import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_a/resources/components/internet_exception.dart';
import 'package:get_a/resources/routes/routes/app_routes.dart';
import 'package:get_a/view/home/home_screen.dart';
import 'package:get_a/view/login/login_screen.dart';
import 'package:get_a/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        getPages: AppRoutes.appRoutes());
  }
}
