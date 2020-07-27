import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/utils/constants.dart';

class LeaderBoardCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Card(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff535C94),
                        fontFamily: "Muli"),
                  ),
                ),
                new SvgPicture.asset(
                  "assets/icons/account_circle.svg",
                  height: 40,
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "John",
                        style: TextStyle(
                            color: Color(0xff535C94),
                            fontSize: 18,
                            fontFamily: "Muli"),
                      ),
                      Text(
                        "22541",
                        style: TextStyle(
                            color: Color(0xff535C94),
                            fontSize: 18,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
