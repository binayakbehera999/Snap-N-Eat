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
    print(screenHeight * 0.06);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Column(
              children: <Widget>[
                Text(
                  "Rank",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: screenHeight * 0.065,
                  ),
                ),
                Text("8th",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.07,
                  )
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
