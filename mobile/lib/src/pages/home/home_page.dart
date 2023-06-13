import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:waiter_app/src/models/mock.dart';
import './components/components.dart';

import 'home_page_view_model.dart';

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
