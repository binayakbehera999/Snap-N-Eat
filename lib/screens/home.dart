import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/screens/friends.dart';
import 'package:snap_n_eat/screens/profile.dart';
import 'package:snap_n_eat/utils/auth.dart';
import 'package:snap_n_eat/screens/leaderboard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({@required this.token, Key key}) : super(key: key);

  final String token;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OAuth auth;
  Widget _child = DashBoard();

  @override
  void initState() {
    super.initState();
    auth = new OAuth();
    auth.fetchAllData(widget.token, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _child,
        floatingActionButton: Container(
          width: 45,
          height: 45,
          child: FittedBox(
            fit: BoxFit.fill,
            child: FloatingActionButton(
              onPressed: () => print("clicked"),
              backgroundColor: Colors.white,
              elevation: 5.0,
              splashColor: Color(0xff29347b),
              child: Icon(
                Icons.camera,
                color: Colors.grey,
                size: 40,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                iconPath: "assets/icons/dashboard.svg", extras: {"label": ""}),
            FluidNavBarIcon(
                iconPath: "assets/icons/account_circle.svg",
                extras: {"label": "Dashboard"}),
            FluidNavBarIcon(
                iconPath: "assets/icons/leaderboard.svg",
                extras: {"label": "partner"}),
            FluidNavBarIcon(iconPath: "assets/icons/analytics.svg",extras: {"label": ""} )
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(
              barBackgroundColor: Color(0xff29347b),
              iconBackgroundColor: Color(0xff29347b),
              iconSelectedForegroundColor: Colors.white,
              iconUnselectedForegroundColor: Colors.white),
          scaleFactor: 2.0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras["label"],
            child: item,
          ),
        ));
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = DashBoard();
          break;
        case 1:
          _child = Profile();
          break;
        case 2:
          _child = LeaderBoard();
          break;
        case 3:
          _child = FriendScreen();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
