import 'package:flutter/material.dart';
import 'package:kotsys_flutter/NavigationDrawer.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: NavigationDrawer(context: context,),
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}