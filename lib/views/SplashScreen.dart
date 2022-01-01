import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kotsys_flutter/views/Dashboard.dart';

import '../LocalStore.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreendState createState() => _SplashScreendState();
}

class _SplashScreendState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => _checkToken());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splashscreen"),
      ),
    );
  }

  void _checkToken() async {
    String t = await LocalStore.readUser();
    MaterialPageRoute nextPage;
    if (t == "") {
      nextPage = MaterialPageRoute(builder: (context) => LoginScreen());
    } else {
      nextPage = MaterialPageRoute(builder: (context) => Dashboard());
    }

    Navigator.pushAndRemoveUntil(
      context,
      nextPage,
      (Route<dynamic> route) => false,
    );
  }
}
