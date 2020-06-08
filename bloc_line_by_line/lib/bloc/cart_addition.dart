import 'package:bloc_line_by_line/models/product.dart';

/**
 * Serve como o payload, ou seja o evento em si
 */
class CartAddition {
  final Product product;
  final int count;

  CartAddition(this.product, [this.count = 1]);
}