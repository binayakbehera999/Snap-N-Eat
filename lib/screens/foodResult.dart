import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/utils/cameraOutput.dart';

class FoodResult extends StatelessWidget {
  final Data data;
  FoodResult({this.data});
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
              child: Text("Data passed to this page:",
               style: TextStyle(fontWeight: FontWeight.w700))),
            Text(data.data),
          ],
        ),
      ),
    );
  }
}
