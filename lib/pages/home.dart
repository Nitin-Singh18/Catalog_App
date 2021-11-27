import 'package:firstapp/Widget/drawer.dart';
import 'dart:convert';
import 'package:firstapp/Widget/items_widget.dart';
import 'package:firstapp/models/homecontent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("Assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

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
        // child: ListView.builder(
        //   itemCount: CatalogModel.items.length,
        //   itemBuilder: (context, index) {
        //     return Itemwidget(
        //       item: CatalogModel.items[index],
        //     );
        //   },
        // ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          itemBuilder: (context, index) {
            final item = CatalogModel.items[index];
            return Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  child: Image.network(item.image),
                  // header: Text(item.name),
                  footer: Container(
                    child: Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ));
          },
          itemCount: CatalogModel.items.length,
        ),
      ),
      // ignore: prefer_const_constructors
      drawer: MyDrawer(),
    );
  }
}
