import 'package:bloc_line_by_line/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({Widget child, Key key, CartBloc cartBloc})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CartBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CartProvider>().cartBloc;
}