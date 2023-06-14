import 'package:flutter/material.dart';

import './components/components.dart';
import '../../models/models.dart';

class HomePageViewModel extends ChangeNotifier {
  final _showModal = ValueNotifier<bool>(false);
  final _tableNumber = ValueNotifier<int>(0);
  final _currentFooter = ValueNotifier<FooterType>(FooterType.waiting);
  final _products = <Product>[];

  bool get showModal => _showModal.value;
  ValueNotifier<FooterType> get currentFooter => _currentFooter;
  ValueNotifier<int> get tableNumber => _tableNumber;
  List<Product> get getProducts => _products;

  showModalInfoTable() {
    _showModal.value = true;
    notifyListeners();
  }

  addProduct(product) {
    if (tableNumber.value == 0) {
      _showModal.value = true;
    }

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
        _currentFooter.value;
      }
    } else {
      _products.remove(product);
      _currentFooter.value = FooterType.withoutOrder;
    }

    refreshFooterState();

    notifyListeners();
  }

  void refreshFooterState() {
    if (_products.isNotEmpty && _tableNumber.value > 0) {
      _currentFooter.value = FooterType.withOrder;
    } else if (_products.isEmpty && _tableNumber.value > 0) {
      _currentFooter.value = FooterType.withoutOrder;
    } else {
      _currentFooter.value = FooterType.waiting;
    }
  }

  void setTableNumber(String value) {
    _showModal.value = false;

    _tableNumber.value = int.tryParse(value) ?? 0;

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
