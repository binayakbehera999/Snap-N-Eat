import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaderBoardCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text(
            "1",
            style: TextStyle(
                fontSize: 10, color: Color(0xff535C94), fontFamily: "Muli"),
          ),
          new SvgPicture.asset("assets/icons/account_circle.svg"),
          Column(
            children: <Widget>[
              Text(
                "John",
                style: TextStyle(
                    color: Color(0xff535C94), fontSize: 10, fontFamily: "Muli"),
              ),
              Text(
                "22541",
                style: TextStyle(
                    color: Color(0xff535C94), fontSize: 15, fontFamily: "Muli"),
              )
            ],
          )
        ],
      ),
    ));
  }
}
