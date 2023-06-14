import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home_page_view_model.dart';
import './components/components.dart';
import '../../models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();
    final tableNumber = viewModel.tableNumber;
    final currentFooter = viewModel.currentFooter;

    return Scaffold(
      bottomNavigationBar: _makeBottomNavigationBar(),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.surfaceTint,
          child: Column(
            children: [
              Header(tableNumber: tableNumber.value),
              CategoriesWidget(categories: Mock.categories),
              MenuWidget(products: Mock.products),
              Footer(currentFooter: currentFooter.value),
            ],
          ),
        ),
      ),
    );
  }

  _makeBottomNavigationBar() {
    void redirect(int value) {
      final currentRoute = ModalRoute.of(context);
      String? routeName = currentRoute?.settings.name;

      switch (value) {
        case 0:
          if (routeName == '/home') return;
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          if (routeName == '/orders') return;
          Navigator.pushNamed(context, '/orders');
          break;
        case 2:
          if (routeName == '/profile') return;
          Navigator.pushNamed(context, '/profile');
          break;
        default:
          if (routeName == '/home') return;
          Navigator.pushNamed(context, '/home');
      }
    }

    return BottomNavigationBar(
      currentIndex: 0,
      onTap: redirect,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_rounded),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Perfil',
        ),
      ],
    );
  }
}
