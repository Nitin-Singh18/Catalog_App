import 'package:firstapp/models/homecontent.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 1, left: 5, right: 7),
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.only(top: 0, right: 10),
            children: [
              Text(
                "\$${catalog.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Buy"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigo.shade900)),
              )
            ]),
      ),
      appBar: AppBar(),
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child:
                  Container(height: 350, child: Image.network(catalog.image)),
            ),
            Expanded(
                child: VxArc(
              height: 15,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        catalog.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        catalog.desc,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
