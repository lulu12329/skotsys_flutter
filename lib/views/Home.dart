import 'package:flutter/material.dart';

import 'CustomAppBar.dart';
import 'NavigationDrawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomedState createState() => _HomedState();
}

class _HomedState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.build(_scaffoldKey, "Home"),
      drawer: NavigationDrawer(
        context: context,
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
