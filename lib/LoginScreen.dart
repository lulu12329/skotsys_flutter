import 'package:flutter/material.dart';
import 'package:kotsys_flutter/LocalStore.dart';

import 'Dashboard.dart';
import 'backend.dart';

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
            ],
          ),
        ],
      ),
    );
  }

  void login() async {
    Backend backend = Backend();
    String result = await backend.signIn(username, password);
    if (result.isEmpty) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
        (Route<dynamic> route) => false,
      );
    } else {
      //TODO: display error message
    }
  }
}
