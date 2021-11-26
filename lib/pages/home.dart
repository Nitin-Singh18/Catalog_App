import 'package:firstapp/Widget/drawer.dart';
import 'package:firstapp/Widget/items_widget.dart';
import 'package:firstapp/models/homecontent.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return Itemwidget(
              item: CatalogModel.items[index],
            );
          },
        ),
      ),
      // ignore: prefer_const_constructors
      drawer: MyDrawer(),
    );
  }
}
