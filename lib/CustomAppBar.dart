import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar build(GlobalKey<ScaffoldState> scaffoldKey, String title) {
    return AppBar(
      leading: InkWell(
        child: Image(image: AssetImage("assets/images/SkotSys_Meteor.png")),
        onTap: () => scaffoldKey.currentState?.openDrawer(),
      ),
      title: Text(title),
      backgroundColor: Colors.black,
    );
  }
}
