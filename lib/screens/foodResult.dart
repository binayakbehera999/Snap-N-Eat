import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:snap_n_eat/screens/home.dart';
import 'package:snap_n_eat/utils/calories.dart';
import 'package:snap_n_eat/utils/cameraOutput.dart';
import 'package:snap_n_eat/utils/constants.dart';

class FoodResult extends StatelessWidget {
  final Food food;
  User user;
  FoodResult({this.food});

  didEat(String food, BuildContext context) {
    FoodDetails calorieIntake = foodCalorie(food);
    var db = Firestore.instance;
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());
    db
        .collection('users')
        .document(user.uid)
        .collection('history')
        .document(updatedDt)
        .get()
        .then((value) {
      double calorie =
          value['calorieIntake'].toDouble() + calorieIntake.calories.toDouble();
      print(value['calorieIntake']);
      db
          .collection('users')
          .document(user.uid)
          .collection('history')
          .document(updatedDt)
          .updateData({"caloriesIntake": calorie}).whenComplete(
              () => navigatedToHome(context));
    });
  }

  didNotEat(BuildContext context) {
    print("didnot take");
    navigatedToHome(context);
  }

  navigatedToHome(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(
                  token: token,
                )));
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<DashBoardProvider>(context, listen: false).user;
    return Scaffold(
      appBar: AppBar(
        title: Text("result"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
                height: 54.0,
                padding: EdgeInsets.all(12.0),
                child: Text("Recognised Food ",
                    style: TextStyle(fontWeight: FontWeight.w700))),
            Text(food.foodName),
            Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        color: primaryColor,
                        child: new SvgPicture.asset(
                          "assets/icons/check.svg",
                          color: Colors.white,
                        ),
                        onPressed: () => didEat(food.foodName, context),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        color: primaryColor,
                        child: new SvgPicture.asset(
                          "assets/icons/clear.svg",
                          color: Colors.white,
                        ),
                        onPressed: () => didNotEat(context),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
