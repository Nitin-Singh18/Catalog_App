import 'package:firstapp/Widget/home_widgets/catalog_widget.dart';
import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/cart_model.dart';
import 'dart:convert';
import 'package:firstapp/models/homecontent.dart';
import 'package:firstapp/utility/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'home_widgets/catalog_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
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

    // final Response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: Colors.yellow[30],
        // backgroundColor: Theme.of(context).canvasColor,

        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
                  backgroundColor: Colors.blue.shade900,
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.cartRoute);
                  },
                  child: Icon(
                    CupertinoIcons.cart,
                  ))
              .badge(
                  color: Colors.red.shade300,
                  count: _cart.items.length,
                  size: 20,
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),

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
