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
import 'package:snap_n_eat/components/loader.dart';

class FoodResult extends StatefulWidget {
  final Food food;

  FoodResult({this.food});

  @override
  _FoodResultState createState() => _FoodResultState();
}

class _FoodResultState extends State<FoodResult> {
  User user;
  bool loading = true;

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
      db
          .collection('users')
          .document(user.uid)
          .collection('history')
          .document(updatedDt)
          .updateData({"calorieIntake": calorie}).whenComplete(
              () => navigatedToHome(context));
    });
  }

  didNotEat(BuildContext context) {
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
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    user = Provider.of<DashBoardProvider>(context, listen: false).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Snap result",
          style: TextStyle(color: primaryColor),
        ),
      ),
      body: loading
          ? Center(
              child: Loader(),
            )
          : Container(
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
                  Text(
                    "Did You Consume it?",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: primaryColor,
                              child: new SvgPicture.asset(
                                "assets/icons/check.svg",
                                color: Colors.white,
                              ),
                              onPressed: () =>
                                  didEat(widget.food.foodName, context),
                            ),
                          ),
                          SizedBox(
                            width: 100.0,
                          ),
                          Expanded(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: primaryColor,
                              child: new SvgPicture.asset(
                                "assets/icons/clear.svg",
                                color: Colors.white,
                              ),
                              onPressed: () => didNotEat(context),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    height: screenHeight * 0.3,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Nutrition Values",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Protein",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "20.0",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Carbs",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "20.0",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Cholesterol",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "20.0",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Fat",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "20.0",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Sugar",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "20.0",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
