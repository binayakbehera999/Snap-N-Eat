import 'dart:convert';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/screens/friends.dart';
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
        } else if (result.containsKey('activities-floors')) {
          dashBoardProvider.setFloor(result['activities-floors'][0]['value']);
        } else if (result.containsKey('activities-distance')) {
          dashBoardProvider
              .setDistance(result['activities-distance'][0]['value']);
        } else if (result.containsKey('activities-heart')) {
          dashBoardProvider
              .setHeartRate(result['activities-heart'][0]['value']);
        } else if (result.containsKey('activities-steps')) {
          dashBoardProvider.setSteps(result['activities-steps'][0]['value']);
        } else if (result.containsKey('sleep')) {
          dashBoardProvider
              .setSleep(result['summary']['totalMinutesAsleep'].toString());
        } else if (result.containsKey('user')) {
          dashBoardProvider.sesetUserDetails(
              result['user']['firstName'],
              result['user']['lastName'],
              result['user']['gender'],
              result['user']['encodedId'],
              result['user']['avatar150'],
              result['user']['height'],
              result['user']['weight']);
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                iconPath: "assets/icons/dashboard.svg",
                extras: {"label": "DashBoard"}),
            FluidNavBarIcon(
                iconPath: "assets/icons/account_circle.svg",
                extras: {"label": "Profile"}),
            FluidNavBarIcon(
                iconPath: "assets/icons/leaderboard.svg",
                extras: {"label": "LeaderBoard"}),
            FluidNavBarIcon(
                iconPath: "assets/icons/friendNav.svg",
                extras: {"label": "Friends"})
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
          print(_child.toString().contains('DashBoard'));
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
        duration: Duration(milliseconds: 200),
        child: _child,
      );
    });
  }
}
