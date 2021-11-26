// ignore_for_file: prefer_const_constructors

import 'package:firstapp/utility/routes.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://hellodesign.co/wp-content/uploads/2020/11/UX-hello-design.jpg";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Singh"),
              accountEmail: Text("Singh@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              MyRoutes.homeRoute;
            },
            minVerticalPadding: 20,
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            horizontalTitleGap: -5,
            title: Text(
              "Home",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            minVerticalPadding: 20,
            leading: Icon(
              Icons.contact_page,
              color: Colors.black,
            ),
            horizontalTitleGap: -5,
            title: Text(
              "Contact",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            minVerticalPadding: 20,
            leading: Icon(
              Icons.mail,
              color: Colors.black,
            ),
            horizontalTitleGap: -5,
            title: Text(
              "E-Mail",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            minVerticalPadding: 20,
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            horizontalTitleGap: -5,
            title: Text(
              "Setting",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 240,
          ),
          ListTile(
            minVerticalPadding: 20,
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.orange,
            ),
            horizontalTitleGap: -5,
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}
