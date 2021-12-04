// ignore_for_file: prefer_const_constructors

import 'package:firstapp/core/store.dart';
import 'package:firstapp/pages/cart_page.dart';
import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/login_page.dart';
import 'package:firstapp/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            toolbarTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          cardColor: Colors.black87,
          canvasColor: Colors.yellow.shade100,
          appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            toolbarTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => loginPage(),
          MyRoutes.loginRoute: (context) => loginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.cartRoute: (context) => CartPage()
        });
  }
}
