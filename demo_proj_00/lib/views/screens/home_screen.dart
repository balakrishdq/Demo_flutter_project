import 'package:demo_proj_00/const.dart';
import 'package:demo_proj_00/controllers/auth_controller.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Home Screen',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await AuthController().signOut();
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(),
    );
  }
}
