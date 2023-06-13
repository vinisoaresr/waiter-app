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
    currentFooter.value = FooterType.withOrder;

    if (_products.contains(product)) {
      final index = _products.indexOf(product);

      _products[index].quantity += 1;
    } else {
      _products.add(product);
    }
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

    if (_products.isEmpty) {
      currentFooter.value = FooterType.waiting;
    }

    notifyListeners();
  }

  void setTableNumber(String value) {
    tableNumber.value = int.tryParse(value) ?? 0;
    notifyListeners();
  }

  void setCurrentFooter(String value) {
    currentFooter.value =
        FooterType.values.firstWhere((element) => element.toString() == value);
    notifyListeners();
  }
}
