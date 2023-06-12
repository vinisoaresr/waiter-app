import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:waiter_app/src/models/product.dart';
import 'package:waiter_app/src/pages/home/widgets/footer_widget.dart';

class OrderState extends InheritedWidget {
  const OrderState({
    super.key,
    required this.tableNumber,
    required this.currentFooter,
    required this.products,
    required super.child,
  });

  final ValueNotifier<int> tableNumber;
  final ValueNotifier<FooterType> currentFooter;
  final List<Product> products;

  get getCurrentFooter => currentFooter;
  List<Product> get getProducts => products;

  addProduct(product) {
    currentFooter.value = FooterType.withOrder;

    if (products.contains(product)) {
      final index = products.indexOf(product);

      products[index].quantity += 1;
    } else {
      products.add(product);
    }
  }

  removeProduct(product) {
    if (products.contains(product)) {
      final index = products.indexOf(product);

      // check if the product has more than one quantity to remove, else remove the product
      if (products[index].quantity > 1) {
        products[index].quantity -= 1;
      } else {
        products.removeAt(index);
        currentFooter.value;
      }
    } else {
      products.remove(product);
      currentFooter.value = FooterType.withoutOrder;
    }
  }

  static OrderState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<OrderState>()!;

  @override
  bool updateShouldNotify(OrderState oldWidget) => true;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'OrderState:\n ${getCurrentFooter.value}\n products ${getProducts.length}\n tableNumber ${tableNumber.value}';
  }
}

class OrderProvider extends StatefulWidget {
  const OrderProvider({super.key, required this.child});

  final Widget Function(BuildContext context, OrderState orderState) child;

  @override
  State<OrderProvider> createState() => _OrderProviderState();
}

class _OrderProviderState extends State<OrderProvider> {
  final tableNumber = ValueNotifier<int>(0);

  final currentFooter = ValueNotifier<FooterType>(FooterType.waiting);

  final List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    tableNumber.addListener(() {
      setState(() {});
      log('tableNumber changed to ${tableNumber.value}');
    });

    currentFooter.addListener(() {
      setState(() {});
      log('currentFooter changed to ${currentFooter.value}');
    });

    return OrderState(
      tableNumber: tableNumber,
      currentFooter: currentFooter,
      products: products,
      child: widget.child,
    );
  }
}
