import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/screens/leaderboard.dart';
import 'package:snap_n_eat/screens/profile.dart';
import 'package:snap_n_eat/screens/splash.dart';
import 'package:snap_n_eat/utils/apiendpoints.dart';
import 'package:snap_n_eat/utils/auth.dart';
import 'package:snap_n_eat/sideapp2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
    auth.authorise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _child,
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
