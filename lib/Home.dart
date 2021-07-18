import 'package:flutter/material.dart';
import 'package:kotsys_flutter/NavigationDrawer.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomedState createState() => _HomedState();
}

class _HomedState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: NavigationDrawer(context: context,),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}