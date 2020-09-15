import 'dart:collection';

import 'package:bloc_line_by_line/models/cart_item.dart';
import 'package:bloc_line_by_line/models/product.dart';

class Cart {

  final List<CartItem> _items = List<CartItem>();

  Cart();

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);
  int get itemCount => _items.length;

  void addItem(Product product) {
    _items.add(CartItem(1, product));
  }

  void removeItem(Product product) {
    final productToRemove = _items.firstWhere((element) => element.product == product);
    if(productToRemove != null) _items.remove(productToRemove);
  }

 
}