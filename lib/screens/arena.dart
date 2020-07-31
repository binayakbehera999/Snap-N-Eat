import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/components/graph.dart';
import 'package:snap_n_eat/utils/constants.dart';

class Arena extends StatefulWidget {
  @override
  _ArenaState createState() => _ArenaState();
}

class _ArenaState extends State<Arena> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 20.0),
          child: Container(
            height: screenHeight * 0.2,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: <Widget>[
                        new SvgPicture.asset(
                          "assets/icons/account_circle.svg",
                          height: 60,
                          color: primaryColor,
                        ),
                        Text(
                          "Binayak Behera",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: primaryColor,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Center(
                      child: new SvgPicture.asset(
                    "assets/icons/vs.svg",
                    height: 70,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: <Widget>[
                        new SvgPicture.asset(
                          "assets/icons/account_circle.svg",
                          height: 60,
                          color: primaryColor,
                        ),
                        Text(
                          "Prateek Mihra",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: primaryColor,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
          child: Container(
            width: screenWidth,
            height: screenHeight * 0.6,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListView(
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Stats",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Graph(),
                      height: screenHeight * 0.3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "3.0",
                            style: TextStyle(fontSize: 15),
                          ),
                          Center(
                            child: Text(
                              "Rating",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Text(
                            "4.0",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
