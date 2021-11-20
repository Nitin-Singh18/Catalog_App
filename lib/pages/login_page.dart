// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:firstapp/pages/home.dart';
import 'package:firstapp/utility/routes.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  void loading() {
    setState(() {
      isloading = true;
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        isloading = false;
      });
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    });
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      // child: Center(
      //   child: Text(" Login Page",
      //       style: TextStyle(
      //         color: Colors.grey[900],
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold,
      //       )),
      // ),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "Assets/image/login_image.png",
              fit: BoxFit.cover,
              scale: 1,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue[900],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username", hintText: "Enter username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Password"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Text(
              "Forget Password?",
              style: TextStyle(color: Colors.orange, fontSize: 12),
            ),
            SizedBox(
              height: 5,
            ),
            // Text(
            //   " Next ",
            //   textAlign: TextAlign.start,
            //   style: TextStyle(
            //       backgroundColor: Colors.indigo[900],
            //       color: Colors.white,
            //       fontSize: 22),
            // ),
            isloading
                ? Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      loading();
                      // Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(children: [TextSpan(text: "L")]),
                      ),
                      // Text(
                      //   "Login",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      decoration: BoxDecoration(
                          // color: Colors.deepOrange,
                          gradient: LinearGradient(colors: [
                            Colors.blue,
                            Colors.pink,
                            Colors.yellow
                          ]),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )

            // ElevatedButton(
            //   child: Text("Sign in"),
            //   onPressed: () {
            //     Navigator.pushNamed(context, MyRoutes.homeRoute);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
