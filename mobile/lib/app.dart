import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waiter_app/src/pages/home/home_page_view_model.dart';
import 'package:waiter_app/src/shared/app_routes.dart';
import 'package:waiter_app/src/shared/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Waiter App',
        theme: AppTheme.themeLight,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
