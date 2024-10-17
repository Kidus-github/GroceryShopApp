import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", "4.00", "assets/images/Avocado.png", Colors.green],
    ["Banana", "2.50", "assets/images/Banana.png", Colors.yellow],
    ["Chicken", "12.80", "assets/images/chicken.png", Colors.brown],
    ["Water", "1.00", "assets/images/water.png", Colors.blue],
  ];
  List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;
  void addItemsToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
    print('added');
  }

  void removeItemfromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String CalculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}
