import 'package:demo_proj_00/const.dart';
import 'package:demo_proj_00/controllers/auth_controller.dart';
import 'package:demo_proj_00/views/screens/auth/login_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Home Screen',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          onPressed: () async {
            await AuthController().signOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => LoginScreen()),
              ),
            );
          },
        ),
      ),
    );
  }
}
