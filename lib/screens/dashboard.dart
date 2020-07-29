import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/customCard.dart';
import 'package:snap_n_eat/components/smallCard.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/utils/constants.dart';
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
      body: Consumer<DashBoardProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          primary: false,
          child: Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(
                screenWidth * 0.12, 30, screenWidth * 0.12, 0),
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
                              color: primaryColor,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            value.fullName.split(" ").first,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 40,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/icons/dashboard.svg",
                        alignment: Alignment.topRight,
                        color: primaryColor,
                      ),
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
                            color: primaryColor,
                            margin: EdgeInsets.all(5.0),
                            shadowColor: Colors.grey,
                            elevation: 15.0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new CircularPercentIndicator(
                                  radius: 90,
                                  lineWidth: 13.0,
                                  animation: true,
                                  percent: 0.7,
                                  center: new SvgPicture.asset(
                                    "assets/icons/calorie.svg",
                                    color: Colors.white,
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.white,
                                  backgroundColor: Color(0xff777EA7),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Text(
                                    value.calorie.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 20,
                                      color: Colors.white,
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
                                    color: Colors.white,
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
                          value: value.heartrate,
                          unit: "scores",
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.35,
                        ),
                        SizedBox(height: screenWidth * 0.03),
                        SmallCard(
                          iconSvg: "assets/icons/distance.svg",
                          unit: "kms",
                          value: value.distance.toString(),
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.35,
                        )
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Column(
                      children: <Widget>[
                        SmallCard(
                          value: value.sleep.toString(),
                          unit: "kcal",
                          iconSvg: "assets/icons/moon.svg",
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.35,
                        ),
                        SizedBox(height: screenWidth * 0.03),
                        CustomCard(
                          iconSvg: "assets/icons/foot.svg",
                          value: value.steps.toString(),
                          unit: "scores",
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.35,
                        ),
                        SizedBox(height: screenWidth * 0.03),
                        CustomCard(
                          iconSvg: "assets/icons/stairs.svg",
                          unit: "kms",
                          value: value.floor.toString(),
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.35,
                        )
                      ],
                    )
                  ],
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () => print("clicked"),
                    shape: CircleBorder(),
                    elevation: 5.0,
                    splashColor: primaryColor,
                    child: Icon(
                      Icons.camera,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
