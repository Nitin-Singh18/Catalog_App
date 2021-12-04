import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade50,
        title: Text(
          "Cart",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _CartList(),
            ),
          ),
          Divider(),
          _cartTotal(),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, store, status) {
                return Text(
                  "\$${_cart.totalPrice}",
                  style: TextStyle(fontSize: 25),
                );
              },
            ),
            WidthBox(230),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Buying Function is not supported yet."),
                    ),
                  );
                },
                child: Text(
                  "Buy",
                  style: TextStyle(),
                )),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Text(
                "Nothing added yet",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                // to remove item from cart list  -> use this
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  // setState(() {});
                },
              ),
              title: Text("${_cart.items[index].name}"),
            ),
          );
  }
}
