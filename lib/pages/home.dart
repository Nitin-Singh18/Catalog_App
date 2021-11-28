import 'package:firstapp/Widget/drawer.dart';
import 'dart:convert';
import 'package:firstapp/models/homecontent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_widgets/catalog_widget.dart';

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
    await Future.delayed(Duration(seconds: 2));
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
        backgroundColor: Colors.yellow[30],

        // ignore: avoid_unnecessary_containers
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(color: Colors.blueGrey.shade50),
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    Expanded(child: CatalogList())
                  else
                    Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              )),
        )
        // ignore: prefer_const_constructors
        // drawer: MyDrawer(),
        );
  }
}
