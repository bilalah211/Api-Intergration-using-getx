import 'package:get/get.dart';
import 'package:get_a/resources/routes/route_name/routes_name.dart';
import 'package:get_a/view/home/home_screen.dart';
import 'package:get_a/view/login/login_screen.dart';
import 'package:get_a/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteNames.homeScreen, page: () => const HomeScreen()),
        GetPage(name: RouteNames.loginScreen, page: () => const LoginScreen()),
        GetPage(name: RouteNames.loginScreen, page: () => const SplashScreen())
      ];
}
