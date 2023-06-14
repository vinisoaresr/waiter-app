import 'package:flutter/material.dart';

import './components/components.dart';
import '../../models/models.dart';

class HomePageViewModel extends ChangeNotifier {
  final tableNumber = ValueNotifier<int>(0);
  final currentFooter = ValueNotifier<FooterType>(FooterType.waiting);
  final List<Product> _products = [];

  get getCurrentFooter => currentFooter;
  List<Product> get getProducts => _products;

  addProduct(product) {
    if (_products.contains(product)) {
      final index = _products.indexOf(product);

      _products[index].quantity += 1;
    } else {
      _products.add(product);
    }

    refreshFooterState();

    notifyListeners();
  }

  removeProduct(product) {
    if (_products.contains(product)) {
      final index = _products.indexOf(product);

      // check if the product has more than one quantity to remove, else remove the product
      if (_products[index].quantity > 1) {
        _products[index].quantity -= 1;
      } else {
        _products.removeAt(index);
        currentFooter.value;
      }
    } else {
      _products.remove(product);
      currentFooter.value = FooterType.withoutOrder;
    }

    refreshFooterState();

    notifyListeners();
  }

  void refreshFooterState() {
    if (_products.isNotEmpty && tableNumber.value > 0) {
      currentFooter.value = FooterType.withOrder;
    } else if (_products.isEmpty && tableNumber.value > 0) {
      currentFooter.value = FooterType.withoutOrder;
    } else {
      currentFooter.value = FooterType.waiting;
    }
  }

  void setTableNumber(String value) {
    tableNumber.value = int.tryParse(value) ?? 0;

    refreshFooterState();

    notifyListeners();
  }

  void cancelOrder() {
    _products.clear();

    setTableNumber('0');

    refreshFooterState();

    notifyListeners();
  }

  void reset() {
    _products.clear();

    setTableNumber('0');

    refreshFooterState();

    notifyListeners();
  }
}
