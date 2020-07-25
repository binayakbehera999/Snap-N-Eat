import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/components/customCard.dart';
import 'package:snap_n_eat/components/smallCard.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        padding:
            EdgeInsets.fromLTRB(screenWidth * 0.12, 50, screenWidth * 0.12, 0),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Hello",
                        style: TextStyle(
                          color: const Color(0xff29347b),
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Binayak",
                        style: TextStyle(
                          color: const Color(0xff29347b),
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/icons/dashboard.svg",
                    alignment: Alignment.topRight,
                    color: const Color(0xff29347b),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.35,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.all(5.0),
                        shadowColor: Colors.grey,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new CircularPercentIndicator(
                              radius: 80.0,
                              lineWidth: 10.0,
                              animation: true,
                              animationDuration: 1200,
                              percent: 0.5,
                              center: SvgPicture.asset(
                                  "assets/icons/calorie.svg",
                                  color: const Color(0xff828282),
                                  semanticsLabel: 'A red up arrow'),
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: const Color(0xff2A347b),
                              progressColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "120",
                                style: TextStyle(
                                  fontFamily: 'Muli',
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Text(
                              "cal",
                              style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    CustomCard(
                      iconSvg: "assets/icons/heartbeat.svg",
                      value: "85",
                      unit: "scores",
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.35,
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    SmallCard(
                      iconSvg: "assets/icons/distance.svg",
                      unit: "kms",
                      value: "2",
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.35,
                    )
                  ],
                ),
                SizedBox(width: screenWidth * 0.03),
                Column(
                  children: <Widget>[
                    SmallCard(
                      value: "20",
                      unit: "kcal",
                      iconSvg: "assets/icons/moon.svg",
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.35,
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    CustomCard(
                      iconSvg: "assets/icons/foot.svg",
                      value: "85",
                      unit: "scores",
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.35,
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    CustomCard(
                      iconSvg: "assets/icons/stairs.svg",
                      unit: "kms",
                      value: "2",
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.35,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
