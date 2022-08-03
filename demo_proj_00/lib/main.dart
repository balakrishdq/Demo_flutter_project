import 'package:demo_proj_00/const.dart';
import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/views/screens/bottom_Bar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: backgroundColor,
      // ),
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: StreamBuilder(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomBar();
          }
          return BottomBar();
        },
      ),
    );
  }
}
