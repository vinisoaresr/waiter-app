import 'dart:io';

import 'package:flutter/material.dart';
import 'package:waiter_app/src/models/mock.dart';
import 'package:waiter_app/src/pages/home/widgets/categories_widget.dart';
import 'package:waiter_app/src/pages/home/widgets/footer_widget.dart';
import 'package:waiter_app/src/pages/home/widgets/header_widget.dart';
import 'package:waiter_app/src/pages/home/widgets/menu_widget.dart';
import 'package:waiter_app/src/providers/order_context.dart';
import 'package:waiter_app/src/shared/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tableNumber = 0;
  FooterType type = FooterType.waiting;

  setTableNumber(int value) {
    setState(() {
      tableNumber = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    tableNumber == 0
        ? type = FooterType.waiting
        : (tableNumber > 0 && OrderProvider.of(context).products.isNotEmpty)
            ? type = FooterType.withOrder
            : type = FooterType.withoutOrder;

    final double height;
    Platform.isAndroid
        ? height = MediaQuery.of(context).viewPadding.top
        : height = 0.0;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: height),
          color: AppColors.bg_4,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Header(tableNumber: tableNumber, callback: setTableNumber),
              CategoriesWidget(categories: Mock.categories),
              MenuWidget(products: Mock.products),
              Footer(callback: setTableNumber, type: type),
            ],
          ),
        ),
      ),
    );
  }
}
