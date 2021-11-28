// ignore_for_file: prefer_const_constructors

import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/login_page.dart';
import 'package:firstapp/utility/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers,
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        themeMode: ThemeMode.light,
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
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => loginPage(),
          MyRoutes.loginRoute: (context) => loginPage(),
          MyRoutes.homeRoute: (context) => HomePage()
        });
  }
}
