import 'package:flutter/material.dart';
import 'package:kotsys_flutter/NavigationDrawer.dart';


class Phonebook extends StatefulWidget {
  Phonebook({Key? key}) : super(key: key);

  @override
  _PhonebookdState createState() => _PhonebookdState();
}

class _PhonebookdState extends State<Phonebook> {

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