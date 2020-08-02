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
import 'package:snap_n_eat/utils/algo.dart';
import 'package:snap_n_eat/utils/calories.dart';
import 'package:snap_n_eat/utils/cameraOutput.dart';
import 'package:snap_n_eat/utils/constants.dart';

class FoodResult extends StatefulWidget {
  final Food food;

  FoodResult({this.food});

  @override
  _FoodResultState createState() => _FoodResultState();
}

class _FoodResultState extends State<FoodResult> {
  User user;
  didEat(String food, BuildContext context) {
    user = Provider.of<DashBoardProvider>(context, listen: false).user;
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
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final rating = RatingCalculator();
    FoodDetails foodDetails = foodCalorie(widget.food);
    double scannedFoodCalorie = foodDetails.calories.toDouble();
    double height = user.height;
    double weight = user.weight;
    String sex = user.gender;
    int age = user.age;
    double bmi = rating.bmiCalculator(height, weight);
    double optimumBmi = rating.optimumWeight(bmi);
    double bmr = rating.bmrCalc(height, weight, bmi, sex, age);
    double newbmr = rating.newBmrCalc(height, optimumBmi, sex, age);
    var db = Firestore.instance;
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());
    double calorieIntake, calorieBurnt;
    db
      .collection('users')
      .document(user.uid)
      .collection('history')
      .document(updatedDt)
      .get()
      .then((value) {
        double calorie = value['calorieIntake'].toDouble();
        setState(() {
          calorieIntake = calorie;
        });
    });

    db
      .collection('users')
      .document(user.uid)
      .collection('history')
      .document(updatedDt)
      .get()
      .then((value) {
        double calorie = value['calorieBurnt'].toDouble();
        setState(() {
          calorieBurnt = calorie;
        });
    });

    bool choice = rating.choice(
        bmr, newbmr, calorieIntake, calorieBurnt, scannedFoodCalorie);
    print(choice);

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
            Text(widget.food.foodName),
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
                        onPressed: () => didEat(widget.food.foodName, context),
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
