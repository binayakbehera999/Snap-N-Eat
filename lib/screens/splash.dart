import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/sideapp2.dart';
import 'package:snap_n_eat/utils/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var oAuth;
  bool check;
  startTime() async {
    var _duration = new Duration(seconds: 2);
    oAuth.getToken().then((value) {
      print(value.accessToken);
      oAuth.validate(value.accessToken).then((value) {
        print(value);
        setState(() {
          check = value;
        });
      });
    });
    return new Timer(_duration, validate);
  }

  void validate() async {
    if (check) {
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => DashBoard()));
    } else {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (BuildContext context) => SideApp()));
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
