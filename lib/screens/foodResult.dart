import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/utils/calories.dart';
import 'package:snap_n_eat/utils/cameraOutput.dart';
import 'package:snap_n_eat/utils/constants.dart';

class FoodResult extends StatelessWidget {
  final Data data;
  FoodResult({this.data});

  didEat(String food) {
    print(food);
    double calorieIntake = foodCalorie(food);
    print(calorieIntake);
  }

  didNotEat() {
    print("didnot take");
  }

  @override
  Widget build(BuildContext context) {
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
                child: Text("Recognised Food",
                    style: TextStyle(fontWeight: FontWeight.w700))),
            Text(data.data),
            Row(children: <Widget>[
              FlatButton(
                color: primaryColor,
                child: new SvgPicture.asset(
                  "assets/icons/check.svg",
                ),
                onPressed: didEat(data.data),
              ),
              FlatButton(
                color: primaryColor,
                child: new SvgPicture.asset(
                  "assets/icons/clear.svg",
                ),
                onPressed: didNotEat(),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
