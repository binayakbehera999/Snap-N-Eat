import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/graph.dart';
import 'package:snap_n_eat/components/profileCard.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/utils/constants.dart';
import 'package:snap_n_eat/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var pulseRate = 231;

  navigatedToHome(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(
                  token: token,
                )));
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Consumer<DashBoardProvider>(
        builder: (context, value, child) => Container(
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
                    InkWell(
                      onTap: () {
                        navigatedToHome(context);
                      },
                      child: SvgPicture.asset(
                        "assets/icons/clear.svg",
                        alignment: Alignment.topRight,
                        color: primaryColor,
                        height: 50,
                      ),
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
                          value.fullName,
                          style: TextStyle(
                              color: primaryColor,
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
                              value.user.uid,
                              style: TextStyle(
                                color: primaryColor,
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: Text(
                                value.rating.toStringAsFixed(2),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.015,
                                    fontWeight: FontWeight.w500),
                              ),
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
                    ProfileCard(
                      iconSvg: "assets/icons/height.svg",
                      unit: "cm",
                      value: ((value.height / 100)).toString(),
                      height: screenWidth * 0.25,
                      width: screenWidth * 0.25,
                    ),
                    ProfileCard(
                      iconSvg: "assets/icons/weight-scale.svg",
                      unit: "KGs",
                      value: (value.weight).toString(),
                      height: screenWidth * 0.25,
                      width: screenWidth * 0.25,
                    ),
                    ProfileCard(
                      iconSvg: "assets/icons/bmi.svg",
                      unit: "k/m2",
                      value: (value.bmi).toStringAsFixed(2),
                      height: screenWidth * 0.25,
                      width: screenWidth * 0.29,
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection('users')
                      .document(value.userId)
                      .collection('history')
                      .orderBy('date', descending: true)
                      .limit(7)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Please Wait");
                    } else {
                      List<DocumentSnapshot> values = snapshot.data.documents;
                      return Graph(
                        viewMode: "profile",
                        user: values,
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
