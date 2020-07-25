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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  var oAuth;
  bool check = true;
  String token;
  var _visible = true;
  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
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
     animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.elasticInOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Image.asset(
          'assets/icons/logo.png',
          width: animation.value * 250,
          height: animation.value * 250,
        ),
      ),
    );
  }
}
