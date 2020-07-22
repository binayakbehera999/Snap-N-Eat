import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snap_n_eat/main.dart';
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

  startTime() async {
    var _duration = new Duration(seconds: 5);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    if(token != null){
      oAuth.validate(token).then((value) {
        print(value);
        setState(() {
          check = value;
        });
      });
    }else{
      setState(() {
          check = false;
      });
    }
    return new Timer(_duration, navigation);
  }

  void navigation() async {
    if (check) {
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => MyHomePage()));
    } else {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
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
