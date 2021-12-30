import 'package:flutter/material.dart';
import 'package:kotsys_flutter/CleaningPlan/CleainingPlan.dart';
import 'package:kotsys_flutter/Dashboard.dart';
import 'package:kotsys_flutter/Home.dart';
import 'package:kotsys_flutter/LocalStore.dart';
import 'package:kotsys_flutter/PhoneBook.dart';
import 'package:kotsys_flutter/SplashScreen.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            // padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/SkotSys_Meteor.png"),
                  height: 50,
                ),
                Text(
                  "Skotsys",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
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
          Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          _createFooter()
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

  Widget _createFooter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          _createDrawerItem(name: "logout", icon: Icons.logout, onTap: _logout),
        ],
      ),
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

  void _logout() {
    LocalStore.deleteuUser();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return SplashScreen();
      },
    ), (Route<dynamic> route) => false);
  }
}
