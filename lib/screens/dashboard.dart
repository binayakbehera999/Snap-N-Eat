import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/components/customCard.dart';
import 'package:snap_n_eat/components/smallCard.dart';
import 'package:snap_n_eat/utils/auth.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   primary: true,
      //   centerTitle: false,
      //   title: Text(
      //     "Hello \n\t\t Binayak",
      //     style: TextStyle(
      //       fontFamily: 'Muli',
      //       fontSize: 30,
      //       color: const Color(0xff29347b),
      //       fontWeight: FontWeight.w700,
      //     ),
      //     textAlign: TextAlign.left,
      //   ),
      //   titleSpacing: 5.0,
      //   actions: <Widget>[
      //     Icon(
      //       Icons.dashboard,
      //       color: const Color(0xff29347b),
      //     ),
      //   ],
      // ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SizedBox(
                        height: screenHeight*0.02,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/icons/dashboard.svg",
                    alignment: Alignment.topRight,
                    color: const Color(0xff29347b),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CustomCard(
                      value: "20",
                      unit: "kcal",
                      percentageIndicator: true,
                      iconSvg: "assets/icons/calorie.svg",
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.35,
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    CustomCard(
                      percentageIndicator: false,
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
                      percentageIndicator: false,
                      iconSvg: "assets/icons/foot.svg",
                      value: "85",
                      unit: "scores",
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.35,
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    CustomCard(
                      percentageIndicator: false,
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
