import 'package:firstapp/models/cart_model.dart';
import 'package:firstapp/models/homecontent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = true;
          final _catalog = CatalogModel();

          _cart.cata = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.indigo.shade900),
      ),
      child: isInCart ? Icon(Icons.done) : Text("Add to cart"),
    );
  }
}
