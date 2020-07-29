import 'package:flutter/material.dart';
import 'package:snap_n_eat/components/leaderBoardCard.dart';
import 'package:snap_n_eat/components/leaderCard.dart';
import 'package:snap_n_eat/utils/constants.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: primaryColor,
              width: screenWidth,
              height: screenHeight * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: <Widget>[
                  Text(
                    "Rank",
                    style: TextStyle(
                      color: Color(0xff535C94),
                      fontSize: 80,
                      fontFamily: "Muli",
                    ),
                  ),
                  Text("8 th",
                      style: TextStyle(
                          fontFamily: "Muli",
                          color: Colors.white,
                          fontSize: 80)),
                ]),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                width: screenWidth,
                height: screenHeight * 0.6,
                child: ListView(
                  children: <Widget>[
                    LeaderCard(),
                    LeaderBoardCard(),
                    LeaderBoardCard(),
                    LeaderBoardCard(),
                    LeaderBoardCard()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
