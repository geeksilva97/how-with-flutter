import 'dart:async';

import 'package:bloc_line_by_line/bloc/cart_addition.dart';
import 'package:bloc_line_by_line/models/cart.dart';

class CartBloc {
  final _cart = Cart();
  StreamController<CartAddition> _cartAdditionController =
      StreamController<CartAddition>();
  StreamController<int> _itemCountController = StreamController<int>();
  StreamController<double> _totalController = StreamController<double>();

  // entrada de dados
  Sink<CartAddition> get cartAddition => _cartAdditionController.sink;

  // saída de dados
  Stream<int> get itemCount => _itemCountController.stream;

  CartBloc() {
    _cartAdditionController.stream.listen((event) {
      _cart.addItem(event.product);
      _itemCountController.sink.add(_cart.itemCount);
      print('O carrinho tem ${_cart.itemCount} itens');
    });
  }

  void dispose() {
    _cartAdditionController.close();
    _itemCountController.close();
  }
}
