import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return ChangeNotifierProvider<DashBoardProvider>( 
      create: (context) => DashBoardProvider(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
