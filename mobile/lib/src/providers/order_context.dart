import 'package:flutter/material.dart';
import 'package:waiter_app/src/models/product.dart';

class OrderContext extends StatefulWidget {
  final Widget child;

  const OrderContext({required this.child, super.key});

  @override
  State<OrderContext> createState() => _OrderContextState();
}

class _OrderContextState extends State<OrderContext> {
  final List<Product> _products = [];

  getProducts() => _products;

  addProduct(product) {
    if (_products.contains(product)) {
      final index = _products.indexOf(product);
      setState(() {
        _products[index].quantity += 1;
      });
    } else {
      setState(() {
        _products.add(product);
      });
    }
  }

  removeProduct(product) {
    if (_products.contains(product)) {
      final index = _products.indexOf(product);
      setState(() {
        // check if the product has more than one quantity to remove else remove the product
        if (_products[index].quantity > 1) {
          _products[index].quantity -= 1;
        } else {
          _products.removeAt(index);
        }
      });
    } else {
      setState(() {
        _products.remove(product);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrderProvider(
      child: widget.child,
      state: this,
      products: _products,
    );
  }
}

class OrderProvider extends InheritedWidget {
  const OrderProvider({
    super.key,
    required super.child,
    required this.products,
    required this.state,
  });

  final _OrderContextState state;
  final List<Product> products;

  static OrderProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<OrderProvider>()!;

  @override
  bool updateShouldNotify(OrderProvider oldWidget) => true;
  // products != oldWidget.products;
}
