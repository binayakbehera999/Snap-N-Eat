import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/graph.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:snap_n_eat/utils/constants.dart';

class Arena extends StatefulWidget {
  final String friendId;
  const Arena({Key key, this.friendId}) : super(key: key);

  @override
  _ArenaState createState() => _ArenaState();
}

class _ArenaState extends State<Arena> {
  User userId;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    userId = Provider.of<DashBoardProvider>(context).user;
    return StreamBuilder(
        stream: Firestore.instance
            .collection("users")
            .document(userId.uid)
            .snapshots(),
        builder: (context, snapshotUser) {
          return !snapshotUser.hasData
              ? Text("Please Wait")
              : StreamBuilder(
                  stream: Firestore.instance
                      .collection("users")
                      .document(widget.friendId)
                      .snapshots(),
                  builder: (context, snapshotFriend) {
                    if (!snapshotFriend.hasData) {
                      return Text("Please Wait");
                    } else {
                      DocumentSnapshot userData = snapshotUser.data;
                      DocumentSnapshot friendData = snapshotFriend.data;

                      var newFormat = DateFormat("yyyy-MM-dd");
                      String updatedDt = newFormat.format(DateTime.now());
                      return Container(
                        color: Colors.white,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 40.0, 15.0, 20.0),
                            child: Container(
                              height: screenHeight * 0.2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.white,
                                elevation: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Column(
                                        children: <Widget>[
                                          Image.network(
                                            userData['avatar'],
                                            height: 60,
                                          ),
                                          Text(
                                            userData["fullName"],
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
                                          Image.network(
                                            friendData['avatar'],
                                            height: 60,
                                          ),
                                          Text(
                                            friendData["fullName"],
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
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 10.0, 15.0, 0.0),
                            child: Container(
                              width: screenWidth,
                              height: screenHeight * 0.65,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 20,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: ListView(
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          "Stats",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      StreamBuilder(
                                        stream: Firestore.instance
                                            .collection("users")
                                            .document(userId.uid)
                                            .collection('history')
                                            .orderBy('date', descending: true)
                                            .limit(7)
                                            .snapshots(),
                                        builder: (context, snapshotUserList) {
                                          return snapshotUserList.hasData
                                              ? StreamBuilder(
                                                  stream: Firestore.instance
                                                      .collection("users")
                                                      .document(widget.friendId)
                                                      .collection('history')
                                                      .orderBy('date',
                                                          descending: true)
                                                      .limit(7)
                                                      .snapshots(),
                                                  builder: (context,
                                                      snapshotFriendList) {
                                                    List<DocumentSnapshot>
                                                        userRatingData =
                                                        snapshotUserList
                                                            .data.documents;
                                                    List<DocumentSnapshot>
                                                        friendRatingData =
                                                        snapshotFriendList
                                                            .data.documents;
                                                    print(userRatingData
                                                        .last.documentID);
                                                    print(friendRatingData
                                                        .last.documentID);
                                                    return Graph(
                                                      viewMode: 'Arena',
                                                      user: userRatingData,
                                                      friend: friendRatingData,
                                                    );
                                                  },
                                                )
                                              : null;
                                        },
                                      ),
                                      ////////////////////////////////////////////////
                                      StreamBuilder(
                                          stream: Firestore.instance
                                              .collection('users')
                                              .document(userId.uid)
                                              .collection('history')
                                              .document(updatedDt)
                                              .snapshots(),
                                          builder:
                                              (context, snapshotUserHistory) {
                                            return StreamBuilder(
                                                stream: Firestore.instance
                                                    .collection('users')
                                                    .document(widget.friendId)
                                                    .collection('history')
                                                    .document(updatedDt)
                                                    .snapshots(),
                                                builder: (context,
                                                    snapshotFriendHistory) {
                                                  DocumentSnapshot userHistory =
                                                      snapshotUserHistory.data;
                                                  DocumentSnapshot
                                                      friendHistory =
                                                      snapshotFriendHistory
                                                          .data;
                                                  print(userHistory);
                                                  print(friendHistory);

                                                  return Column(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Text(
                                                              "3.0",
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "Scores",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                            Text(
                                                              "4.0",
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Text(
                                                              userHistory[
                                                                      'rating']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "Rating",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                            Text(
                                                              friendHistory[
                                                                      "rating"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Text(
                                                              userHistory[
                                                                      "calorieIntake"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "Calorie Intake",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                            Text(
                                                              friendHistory[
                                                                      "calorieIntake"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Text(
                                                              userHistory[
                                                                      "calorieBurnt"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "Calorie Burnt",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                            Text(
                                                              friendHistory[
                                                                      "calorieBurnt"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }),
                                      ////////////////////////////////////////////////
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                      );
                    }
                  });
        });
  }
}
