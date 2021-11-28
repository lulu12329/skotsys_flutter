import 'package:flutter/material.dart';
import 'package:kotsys_flutter/NavigationDrawer.dart';
import 'package:kotsys_flutter/backend.dart';

import '../CustomAppBar.dart';
import '../User.dart';

class CleaningPlan extends StatefulWidget {
  CleaningPlan({Key? key}) : super(key: key);

  @override
  _CleaningPlandState createState() => _CleaningPlandState();
}

class _CleaningPlandState extends State<CleaningPlan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    User user = User();
    user.toJson();

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.build(_scaffoldKey, "CleaningPlan"),
      drawer: NavigationDrawer(context: context),
      body: Center(
        child: Text("CleaningPlan"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Backend().getCleaningPlanData().then((value) => {});
  }
}
