import 'package:flutter/material.dart';
import 'package:waiter_app/src/pages/home/home_page.dart';
import 'package:waiter_app/src/pages/splash/splash_page.dart';
import 'package:waiter_app/src/pages/success/success_order.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String success = '/success';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashPage(),
    home: (context) => const HomePage(),
    success: (context) => const SuccessOrder(),
  };
}
