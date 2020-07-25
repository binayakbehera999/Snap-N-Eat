import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/screens/home.dart';
import 'package:snap_n_eat/screens/leaderboard.dart';
import 'package:snap_n_eat/screens/profile.dart';
import 'package:snap_n_eat/screens/splash.dart';
import 'package:snap_n_eat/utils/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
