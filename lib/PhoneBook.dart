import 'package:flutter/material.dart';
import 'package:kotsys_flutter/NavigationDrawer.dart';

import 'CustomAppBar.dart';


class Phonebook extends StatefulWidget {
  Phonebook({Key? key}) : super(key: key);

  @override
  _PhonebookdState createState() => _PhonebookdState();
}

class _PhonebookdState extends State<Phonebook> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.build(_scaffoldKey, "Phonebook"),
      drawer: NavigationDrawer(context: context,),
      body: Center(
        child: Text("Phonebook"),
      ),
    );
  }
}