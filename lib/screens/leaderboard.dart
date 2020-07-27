import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/components/leaderBoardCard.dart';

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
      backgroundColor: const Color(0xff29347b),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                    fontFamily: "Muli", color: Colors.white, fontSize: 80)),
            Container(
                color: Colors.white,
                height: screenHeight * 0.5,
                width: screenWidth,
                child: ListView(
                  children: <Widget>[
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
