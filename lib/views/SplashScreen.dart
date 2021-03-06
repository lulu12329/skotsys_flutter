import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kotsys_flutter/session.dart';

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
    try {
      String t = await LocalStore.readUser();
      Session().fromJson(json.decode(t));
      if (Session().token == "") throw Exception("no token stored");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
        (Route<dynamic> route) => false,
      );
    } catch (_) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
