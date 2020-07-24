import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snap_n_eat/screens/home.dart';
import 'package:snap_n_eat/screens/login.dart';
import 'package:snap_n_eat/utils/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var oAuth;
  bool check = true;
  String token;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    if (token != null) {
      oAuth.validate(token).then((value) {
        setState(() {
          check = value;
        });
        return new Timer(_duration, navigation);
      });
    } else {
      setState(() {
        check = false;
      });
      return new Timer(_duration, navigation);
    }
  }

  void navigation() async {
    if (check) {
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => MyHomePage(token: token,)));
    } else {
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    oAuth = new OAuth();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
    );
  }
}
