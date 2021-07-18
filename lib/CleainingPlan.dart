import 'package:flutter/material.dart';
import 'package:kotsys_flutter/NavigationDrawer.dart';


class CleaningPlan extends StatefulWidget {
  CleaningPlan({Key? key}) : super(key: key);

  @override
  _CleaningPlandState createState() => _CleaningPlandState();
}

class _CleaningPlandState extends State<CleaningPlan> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phonebook"),
      ),
      drawer: NavigationDrawer(context: context,),
      body: Center(
        child: Text("Phonebook"),
      ),
    );
  }
}