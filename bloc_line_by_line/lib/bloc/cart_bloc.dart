import 'dart:async';

import 'package:bloc_line_by_line/bloc/cart_addition.dart';

import 'cart.dart';

/**
 * Serve como Controller, gerenciano as entradas e saídas
 */

class CartBloc {
  final Cart _cart = Cart();
  final StreamController<CartAddition> _cartAdditionController = StreamController<CartAddition>();
  final StreamController<int> _itemCountController = StreamController<int>.broadcast();

  CartBloc() {
    _cartAdditionController.stream.listen((cartAddition) {
      _cart.addItem(cartAddition.product);
      _itemCountController.sink.add(_cart.itemCount);
      print('${cartAddition.product}');
      print('${_cart.itemCount} itens');
    });
  }

  Sink<CartAddition> get cartAddition => _cartAdditionController.sink;
  Stream<int> get itemStream => _itemCountController.stream;
  
  void dispose() {
    _cartAdditionController.close();
    _itemCountController.close();
  }

}