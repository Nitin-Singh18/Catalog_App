import 'package:firstapp/models/homecontent.dart';
import 'package:flutter/material.dart';

class Itemwidget extends StatelessWidget {
  final Item item;
  const Itemwidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0.0),
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.des),
        trailing: Text("Rs. ${item.price}",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
