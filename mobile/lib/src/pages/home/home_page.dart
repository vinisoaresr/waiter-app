import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:waiter_app/src/models/mock.dart';
import 'package:waiter_app/src/pages/home/widgets/categories_widget.dart';
import 'package:waiter_app/src/pages/home/widgets/footer_widget.dart';
import 'package:waiter_app/src/pages/home/widgets/header_widget.dart';
import 'package:waiter_app/src/pages/home/widgets/menu_widget.dart';
import 'package:waiter_app/src/providers/order_context.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = OrderState.of(context);
    final tableNumber = state.tableNumber;
    final currentFooter = state.currentFooter;
    log('build called on home_page.dart');

    return Scaffold(
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
}
