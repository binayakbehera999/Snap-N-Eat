import 'dart:convert';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/screens/leaderboard.dart';
import 'package:snap_n_eat/screens/profile.dart';
import 'package:snap_n_eat/utils/auth.dart';

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
    loadData(context);
  }

  loadData(BuildContext context) {
    auth = new OAuth();
    auth.fetchAllData(widget.token).then((list) {
      final dashBoardProvider =
          Provider.of<DashBoardProvider>(context, listen: false);
      list.map((response) {
        Map result = json.decode(response.body);
        print(result);
        if (result.containsKey('activities-calories')) {
          dashBoardProvider
              .setCalories(result['activities-calories'][0]['value']);
          print(result['activities-calories'][0]['value'].runtimeType);
        } else if (result.containsKey('activities-floors')) {
          dashBoardProvider.setFloor(result['activities-floors'][0]['value']);
          print(result['activities-floors'][0]['value'].runtimeType);
        } else if (result.containsKey('activities-distance')) {
          dashBoardProvider
              .setDistance(result['activities-distance'][0]['value']);
          print(result['activities-distance'][0]['value'].runtimeType);
        } else if (result.containsKey('activities-heart')) {
          dashBoardProvider
              .setHeartRate(result['activities-heart'][0]['value']);
          print(result['activities-heart'][0]['value'].runtimeType);
        } else if (result.containsKey('activities-steps')) {
          dashBoardProvider.setSteps(result['activities-steps'][0]['value']);
          print(result['activities-steps'][0]['value'].runtimeType);
        } else if (result.containsKey('sleep')) {
          dashBoardProvider
              .setSleep(result['summary']['totalMinutesAsleep'].toString());
          print(result['summary']['totalMinutesAsleep'].runtimeType);
        } else if (result.containsKey('user')) {
          dashBoardProvider.setFirstName(result['user']['firstName']);
        }
      }).toList();
    });
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
        duration: Duration(milliseconds: 200),
        child: _child,
      );
    });
  }
}
