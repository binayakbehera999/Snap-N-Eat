import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snap_n_eat/components/card.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: Colors.white,
        primary: true,
        centerTitle: false,
        title: Text(
          "Hello \n\t\t Binayak",
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 25,
            color: const Color(0xff29347b),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
        titleSpacing: 5.0,
        actions: <Widget>[
          Icon(
            Icons.dashboard,
            color: const Color(0xff29347b),
          ),
        ],
      ),
      body: Container(
        width: 200,
        height: 200,
        color: Colors.white,
        child: CustomCard(cardHeight: 250.0, cardWidth: 250.0, iconSvg: "assets/icons/dashboard.svg", value: 2.toString(), unit: "KCal" ),
      ),
    );
  }
}
