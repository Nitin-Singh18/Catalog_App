import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int age = 20;
    String hobby = "cycling";
    double point = 3.22;

    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Material(
        child: Center(
          // ignore: avoid_unnecessary_containers

          child: Container(
            // ignore: prefer_const_constructors
            child: Text(
              "Welcome $point, My name is Nitin  and i'm $age years old. My hobby is $hobby.",
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: Colors.red,
                  backgroundColor: Colors.black,
                  fontSize: 16),
            ),
          ),
        ),
      ),
      // ignore: prefer_const_constructors
      drawer: Drawer(),
    );
  }
}
