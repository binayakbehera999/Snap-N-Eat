import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/constants.dart';

class LeaderBoardCard extends StatelessWidget {
  final String name, avatar;
  final int rank;
  final double score;
  LeaderBoardCard({this.name, this.rank, this.score, this.avatar});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Card(
            elevation: 15.0,
            shadowColor: lightGradient,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Text(
                    rank.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff535C94),
                        fontFamily: "Muli"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Image.network(
                    avatar,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            color: Color(0xff535C94),
                            fontSize: 15,
                            fontFamily: "Muli"),
                      ),
                      Text(
                        score.toString(),
                        style: TextStyle(
                            color: Color(0xff535C94),
                            fontSize: 15,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
