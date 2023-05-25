import 'package:flutter/material.dart';
import 'package:flutter_demo/model/product.dart';

class CartList extends ChangeNotifier{
  final List<Product> _cartList = <Product>[];
  List<Product> get cartList => _cartList;

  add(Product item) {
    _cartList.add(item);
    notifyListeners();
  }

  remove(Product item) {
    _cartList.remove(item);
    notifyListeners();
  }

  removeAll() {
    _cartList.clear();
    notifyListeners();
  }
}