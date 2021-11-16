// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firstapp/pages/home.dart';
import 'package:firstapp/utility/routes.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

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
            ElevatedButton(
              child: Text("Sign in"),
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
