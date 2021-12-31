import 'package:flutter/material.dart';
import '../../services/loginService.dart';
import '../Dashboard.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TODO: these values are only for testing and should be removed before release
  String email = "sa@gmail.com";
  String password = "password";

  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Image(
                  alignment: Alignment.center,
                  image: AssetImage("assets/images/SkotSys_Meteor.png"),
                  height: 60,
                ),
              ),
              Text("SkotSys"),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Nutzername oder Email"),
                  TextField(
                    onChanged: (s) => {email = s},
                  ),
                  Text("Passwort"),
                  TextField(
                    onChanged: (s) => {password = s},
                    obscureText: true,
                  ),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: login,
                      child: Text("Login"),
                    ),
                    Text(
                      errorText,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    try {
      await LoginService.login(email, password);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
        (Route<dynamic> route) => false,
      );
    } catch (_) {
      setState(() {
        errorText = "login failed";
      });
    }
  }
}
