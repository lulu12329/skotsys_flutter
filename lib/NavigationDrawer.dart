import 'package:flutter/material.dart';
import 'package:kotsys_flutter/CleainingPlan.dart';
import 'package:kotsys_flutter/Dashboard.dart';
import 'package:kotsys_flutter/Home.dart';
import 'package:kotsys_flutter/PhoneBook.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "image",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Skotsys",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          _createDrawerItem(
            name: "Home",
            icon: Icons.home,
            onTap: _goToHome,
          ),
          _createDrawerItem(
            name: "Dashboard",
            icon: Icons.dashboard,
            onTap: _goToDashBoard,
          ),
          _createDrawerItem(
              name: "CleaningPlan",
              icon: Icons.cleaning_services,
              onTap: _goToCleaningplan),
          _createDrawerItem(
            name: "Phonebook",
            icon: Icons.phone,
            onTap: _goToPhonebook,
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required String name,
      required IconData icon,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(name),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  void _goToDashBoard() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return Dashboard();
      },
    ), (Route<dynamic> route) => false);
  }

  void _goToHome() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return Home();
      },
    ), (Route<dynamic> route) => false);
  }

  void _goToPhonebook() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return Phonebook();
      },
    ), (Route<dynamic> route) => false);
  }

  void _goToCleaningplan() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return CleaningPlan();
      },
    ), (Route<dynamic> route) => false);
  }
}
