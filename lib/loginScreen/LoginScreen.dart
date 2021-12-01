import 'package:flutter/material.dart';
import 'package:kotsys_flutter/services/loginService.dart';

import '../Dashboard.dart';
import '../services/backend.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              //Text("LOGO"),
              Text("SkotSys"),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Nutzername"),
              TextField(
                onChanged: (s) => {username = s},
              ),
              Text("Passwort"),
              TextField(
                onChanged: (s) => {password = s},
              ),
              TextButton(
                onPressed: login,
                child: Text("Login"),
              ),
              Text(
                'login failed',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ],
      ),
    );
  }

  void login() async {
    try {
      await LoginService.login(username, password);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
        (Route<dynamic> route) => false,
      );
    } catch (_) {}
  }
}
