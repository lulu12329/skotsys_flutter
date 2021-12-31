import 'package:flutter/material.dart';

import 'CustomAppBar.dart';
import 'NavigationDrawer.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.build(_scaffoldKey, "Dashboard"),
      drawer: NavigationDrawer(
        context: context,
      ),
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
