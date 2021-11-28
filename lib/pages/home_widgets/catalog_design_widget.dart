import 'package:firstapp/models/homecontent.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 120,
        width: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo[50]),
                child: Image.network(
                  catalog.image,
                  width: 100,
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  catalog.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                    fontSize: 18,
                  ),
                ),
                Text(
                  catalog.desc,
                  style: TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.only(top: 0, right: 10),
                      children: [
                        Text(
                          "\$${catalog.price}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Buy"),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.indigo.shade900)))
                      ]),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
