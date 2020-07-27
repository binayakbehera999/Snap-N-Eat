import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/components/graph.dart';
import 'package:snap_n_eat/components/smallCard.dart';
import 'package:snap_n_eat/utils/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var pulseRate = 231;
  var email = 'binayakbehera@gmail.com';
  var rating = 4.0;
  var height = 5.8;
  var weight = 70;
  var bmi = 22.3;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(10, screenHeight * 0.05, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/heartbeat.svg",
                          alignment: Alignment.topRight,
                          color: Colors.white,
                          height: screenHeight * 0.02,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          pulseRate.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/dashboard.svg",
                    alignment: Alignment.topRight,
                    color: const Color(0xff29347b),
                    height: screenHeight * 0.03,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    // SvgPicture.asset(
                    //   "assets/icons/radial_gradient.svg",
                    //   height: screenWidth * 0.3,
                    //   color: primaryColor,
                    // ),
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: new BoxDecoration(
                        color: lightGradient,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: screenWidth * 0.30,
                      width: screenWidth * 0.30,
                      decoration: new BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: screenWidth * 0.25,
                      width: screenWidth * 0.25,
                      decoration: new BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/profile.svg",
                      height: screenWidth * 0.2,
                      color: Colors.white,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Binayak \nBehera",
                        style: TextStyle(
                            color: const Color(0xff29347b),
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 3,
                      width: screenWidth * 0.4,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/icon_email.svg",
                            color: primaryColor,
                            height: screenWidth * 0.02,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$email",
                            style: TextStyle(
                              color: const Color(0xff29347b),
                              fontWeight: FontWeight.w300,
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: screenHeight * 0.015,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.015,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SmallCard(
                    iconSvg: "assets/icons/height.svg",
                    unit: "ft",
                    value: "$height",
                    height: screenWidth * 0.28,
                    width: screenWidth * 0.25,
                  ),
                  SmallCard(
                    iconSvg: "assets/icons/weight-scale.svg",
                    unit: "KGs",
                    value: "$weight",
                    height: screenWidth * 0.28,
                    width: screenWidth * 0.25,
                  ),
                  SmallCard(
                    iconSvg: "assets/icons/bmi.svg",
                    unit: "kg/m^2",
                    value: "$height",
                    height: screenWidth * 0.28,
                    width: screenWidth * 0.25,
                  ),
                ],
              ),
            ),
            Graph(),
          ],
        ),
      ),
    );
  }
}
