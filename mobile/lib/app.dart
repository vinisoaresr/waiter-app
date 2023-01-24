import 'package:flutter/material.dart';
import 'package:waiter_app/src/pages/home/home_page.dart';
import 'package:waiter_app/src/providers/order_context.dart';
import 'package:waiter_app/src/shared/app_routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return OrderContext(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waiter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    ));
  }
}
