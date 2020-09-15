import 'package:badges/badges.dart';
import 'package:bloc_line_by_line/bloc/cart_addition.dart';
import 'package:bloc_line_by_line/bloc/cart_bloc.dart';
import 'package:bloc_line_by_line/bloc/cart_provider.dart';
import 'package:bloc_line_by_line/models/cart.dart';
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
    /// _cartBloc.dispose()
  }

  @override
  Widget build(BuildContext context) {
  
    final _cartBloc = CartProvider.of(context);

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
                _cartBloc.cartAddition
                    .add(CartAddition(Product(index, 'Product $index', 99.99)));
              },
            ),
          );
        },
      ),
    );
  }

  Widget _shoppingCartBadge() {

    final _cartBloc = CartProvider.of(context);

    return StreamBuilder<int>(
      stream: _cartBloc.itemCount,
      initialData: 0,
      builder: (_, snapshot) {
        return Badge(
          position: BadgePosition.topRight(top: 0, right: 3),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            '${snapshot.data}',
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        );
      },
    );
    // return Badge(
    //   position: BadgePosition.topRight(top: 0, right: 3),
    //   animationDuration: Duration(milliseconds: 300),
    //   animationType: BadgeAnimationType.slide,
    //   badgeContent: Text(
    //     '${cart.items.length}',
    //     style: TextStyle(color: Colors.white),
    //   ),
    //   child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    // );
  }
}
