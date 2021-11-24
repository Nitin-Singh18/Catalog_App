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
    // ignore: avoid_unnecessary_containers, prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_constructors
        // home: HomePage(),
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => loginPage(),
          MyRoutes.loginRoute: (context) => loginPage(),
          MyRoutes.homeRoute: (context) => HomePage()
        });
  }
}
