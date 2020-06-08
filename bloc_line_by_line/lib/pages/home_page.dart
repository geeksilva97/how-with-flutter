import 'package:badges/badges.dart';
import 'package:bloc_line_by_line/bloc/cart_addition.dart';
import 'package:bloc_line_by_line/bloc/cart_provider.dart';
import 'package:bloc_line_by_line/models/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
        actions: <Widget>[_shoppingCartBadge()],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('Product $index'),
            subtitle: Text('Description of product $index'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cartBloc.cartAddition
                    .add(CartAddition(Product(index, 'Product $index')));
              },
            ),
          );
        },
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return StreamBuilder<int>(
      initialData: 0,
      stream: CartProvider.of(context).itemStream,
      builder: (_, asyncSnapshot) {
        return Badge(
          position: BadgePosition.topRight(top: 0, right: 3),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            '${asyncSnapshot.data}',
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                
              }),
        );
      },
    );
  }
}
