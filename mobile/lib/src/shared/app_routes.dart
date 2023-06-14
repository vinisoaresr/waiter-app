import 'package:flutter/material.dart';
import 'package:waiter_app/src/pages/home/home_page.dart';
import 'package:waiter_app/src/pages/splash/splash_page.dart';
import 'package:waiter_app/src/pages/success/success_order.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String success = '/success';
  static const String home = '/home';
  static const String orders = '/orders';
  static const String profile = '/profile';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashPage(),
    success: (context) => const SuccessOrder(),
    home: (context) => const HomePage(),
    orders: (context) => const Text('Orders'),
    profile: (context) => const Text('profile'),
  };
}
