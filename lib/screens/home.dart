import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/screens/friends.dart';
import 'package:snap_n_eat/screens/insurance.dart';
import 'package:snap_n_eat/screens/leaderboard.dart';
import 'package:snap_n_eat/utils/algo.dart';
import 'package:snap_n_eat/utils/auth.dart';
import 'package:snap_n_eat/utils/constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({@required this.token, Key key}) : super(key: key);

  final String token;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OAuth auth;
  Widget _child = DashBoard();
  String userId;

  @override
  void initState() {
    super.initState();
    loadData(context);
  }

  loadData(BuildContext context) {
    auth = new OAuth();
    var db = Firestore.instance;
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());
    auth.fetchAllData(widget.token).then((list) {
      final dashBoardProvider =
          Provider.of<DashBoardProvider>(context, listen: false);

      list.map((response) {
        Map result = json.decode(response.body);
        if (result.containsKey('activities-calories')) {
          dashBoardProvider
              .setCalories(result['activities-calories'][0]['value']);
          db
              .collection('users')
              .document(userId)
              .collection('history')
              .orderBy('date', descending: true)
              .limit(1)
              .getDocuments()
              .then((value) {
            List<DocumentSnapshot> values = value.documents;
            if (values.first.documentID == updatedDt) {
              db
                  .collection('users')
                  .document(userId)
                  .collection('history')
                  .document(updatedDt)
                  .updateData(
                {
                  'calorieBurnt': result['activities-calories'][0]['value'],
                },
              ).whenComplete(() => print("CaloriesBurnt is update"));
            }
          });
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
          userId = result['user']['encodedId'];
          double rating = RatingCalculator()
              .healthRating(result['user']['weight'], result['user']['height']);
          double bmi = RatingCalculator().bmiCalculator(
              result['user']['height'], result['user']['weight']);
          db.collection('users').document(userId).updateData({
            'weight': result['user']['weight'],
            'rating': rating,
          }).whenComplete(() {
            db
                .collection('users')
                .document(userId)
                .collection('history')
                .orderBy('date', descending: true)
                .limit(1)
                .getDocuments()
                .then((value) {
              List<DocumentSnapshot> values = value.documents;
              if (values.first.documentID != updatedDt) {
                db
                    .collection('users')
                    .document(userId)
                    .collection('history')
                    .document(updatedDt)
                    .setData({
                  'date': updatedDt,
                  'caloriesIntake': 0.0,
                  'rating': rating
                }, merge: true).whenComplete(() => print("New Date is Added"));
              }
            });
          });

          dashBoardProvider.setUserDetails(
            result['user']['fullName'],
            result['user']['gender'],
            result['user']['encodedId'],
            result['user']['avatar150'],
            result['user']['height'],
            result['user']['weight'],
            rating,
            bmi,
          );
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
                iconPath: "assets/icons/list-box.svg",
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
              barBackgroundColor: primaryColor,
              iconBackgroundColor: primaryColor,
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
          _child = Insurance();
          break;
        case 2:
          _child = LeaderBoard(
            userId: userId,
          );
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
