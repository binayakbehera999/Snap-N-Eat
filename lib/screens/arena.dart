import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/graph.dart';
import 'package:snap_n_eat/components/loader.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:snap_n_eat/utils/algo.dart';
import 'package:snap_n_eat/utils/constants.dart';

class Arena extends StatefulWidget {
  final String friendId;
  final String user;
  final String arguement;
  final double intialWeight;
  final int noOfDaysCompleted;
  final int noOfDays;

  const Arena({
    Key key,
    this.friendId,
    this.user,
    this.arguement,
    this.intialWeight,
    this.noOfDaysCompleted,
    this.noOfDays,
  }) : super(key: key);

  @override
  _ArenaState createState() => _ArenaState();
}

class _ArenaState extends State<Arena> {
  User userId;
  DocumentSnapshot userProfile;
  DocumentSnapshot friendProfile;
  bool loadingState = true;
  List<DocumentSnapshot> userRatingData, friendRatingData;
  DocumentSnapshot userHistory, friendHistory;
  double friendScore, userScore;

  @override
  void initState() {
    super.initState();
    getChallengeData();
  }

  getChallengeData() async {
    List<String> _userList = [widget.user, widget.friendId];
    List<String> _friendsId = [widget.friendId];
    var db = Firestore.instance;

    List<DocumentSnapshot> profileSnapshot = await Future.wait(
        _userList.map((e) => db.collection('users').document(e).get()));
    List<DocumentSnapshot> friendsChallenge = await Future.wait(_friendsId.map(
        (e) => db
            .collection('users')
            .document(widget.user)
            .collection('acceptedChallengeRequest')
            .document(widget.friendId)
            .get()));
    List<QuerySnapshot> ratingQuerySnapshot = await Future.wait(_userList.map(
        (e) => (e == widget.user)
            ? db
                .collection('users')
                .document(widget.user)
                .collection('acceptedChallengeRequest')
                .document(widget.friendId)
                .collection('history')
                .orderBy('date', descending: true)
                .limit(7)
                .getDocuments()
            : db
                .collection('users')
                .document(widget.friendId)
                .collection('acceptedChallengeRequest')
                .document(widget.user)
                .collection('history')
                .orderBy('date', descending: true)
                .limit(7)
                .getDocuments()));
    userRatingData = ratingQuerySnapshot.first.documents;
    friendRatingData = ratingQuerySnapshot.last.documents;

    List<QuerySnapshot> historyQuerySnapshot = await Future.wait(_userList.map(
        (e) => (e == widget.user)
            ? db
                .collection('users')
                .document(widget.user)
                .collection('history')
                .orderBy('date', descending: true)
                .limit(1)
                .getDocuments()
            : db
                .collection('users')
                .document(widget.friendId)
                .collection('history')
                .orderBy('date', descending: true)
                .limit(1)
                .getDocuments()));
    userProfile = profileSnapshot.first;
    friendProfile = profileSnapshot.last;
    userHistory = historyQuerySnapshot.first.documents.first;
    friendHistory = historyQuerySnapshot.last.documents.first;
    DocumentSnapshot friendChallengeHistory = friendsChallenge.first;

    userScore = RatingCalculator().goalRating(
        widget.intialWeight,
        userProfile['weight'],
        widget.noOfDays,
        widget.noOfDaysCompleted,
        userProfile['height']);
    friendScore = RatingCalculator().goalRating(
        friendChallengeHistory['initialWeight'].toDouble(),
        friendProfile['weight'],
        widget.noOfDays,
        widget.noOfDaysCompleted,
        friendProfile['height']);
    // print(userHistory['calorieIntake'].runtimeType);
    // print(userScore);
    // print(friendScore);
    // print(friendHistory.data);
    // print(userScore.toStringAsFixed(2).runtimeType);
    // print(friendScore.toStringAsFixed(2).runtimeType);
    // print(userHistory['rating'].toStringAsFixed(1).runtimeType);
    // print(friendHistory['rating'].toStringAsFixed(1).runtimeType);
    // print(userHistory['calorieIntake'].toString().runtimeType);
    // print(friendHistory['calorieIntake'].toString().runtimeType);
    // print(userHistory['calorieBurnt'].runtimeType);
    // print(friendHistory['calorieBurnt'].runtimeType);

    setState(() {
      loadingState = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    userId = Provider.of<DashBoardProvider>(context).user;
    return loadingState
        ? Center(
            child: Loader(),
          )
        : Container(
            color: Colors.white,
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
                              Image.network(
                                userProfile['avatar'],
                                height: 60,
                              ),
                              Text(
                                userProfile["fullName"],
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
                                friendProfile['avatar'],
                                height: 60,
                              ),
                              Text(
                                friendProfile["fullName"],
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
                  height: screenHeight * 0.65,
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
                              style: TextStyle(
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Graph(
                            viewMode: 'Arena',
                            user: userRatingData,
                            friend: friendRatingData,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  userScore.toStringAsFixed(2),
                                  style: TextStyle(fontSize: 15),
                                ),
                                Center(
                                  child: Text(
                                    "Scores",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Text(
                                  friendScore.toStringAsFixed(2),
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  userHistory['rating'].toStringAsFixed(2),
                                  style: TextStyle(fontSize: 15),
                                ),
                                Center(
                                  child: Text(
                                    "Rating",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Text(
                                  friendHistory['rating'].toStringAsFixed(2),
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  userHistory['calorieIntake'].toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                                Center(
                                  child: Text(
                                    "Calorie Intake",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Text(
                                  friendHistory['calorieIntake'].toString(),
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  userHistory['calorieBurnt'].toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                                Center(
                                  child: Text(
                                    "Calorie Burnt",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Text(
                                  friendHistory['calorieBurnt'].toString(),
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          );

///////////////////////////////////////////////////////////////////////////////////////////////
  }
}
