import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/utils/constants.dart';

class LeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Card(
            elevation: 15.0,
            shadowColor: lightGradient,
            color: primaryColor,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 20, color: Colors.white, fontFamily: "Muli"),
                  ),
                ),
                new SvgPicture.asset(
                  "assets/icons/account_circle.svg",
                  height: 40,
                  width: 40,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "John",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Muli"),
                      ),
                      Text(
                        "22541",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new SvgPicture.asset(
                    "assets/icons/crown.svg",
                    color: Colors.yellow,
                    height: 30,
                    width: 30,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
