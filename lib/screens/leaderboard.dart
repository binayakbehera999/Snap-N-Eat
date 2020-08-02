import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/leaderBoardCard.dart';
import 'package:snap_n_eat/components/leaderCard.dart';
import 'package:snap_n_eat/components/loader.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:snap_n_eat/utils/constants.dart';

class LeaderBoard extends StatefulWidget {
  final String userId;
  const LeaderBoard({Key key, this.userId}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  User user;
  List<DocumentSnapshot> friendsList = new List<DocumentSnapshot>();
  bool isDataFetched = false;
  String position;

  @override
  void initState() {
    super.initState();
    getFriendsData();
  }

  Future<void> getFriendsData() async {
    var db = Firestore.instance;
    List<String> _user = [widget.userId];
    List<QuerySnapshot> friends = await Future.wait(_user.map((e) => db
        .collection('users')
        .document(e)
        .collection('Friends')
        .getDocuments()));
    List<DocumentSnapshot> friendList = friends.first.documents;
    List<DocumentSnapshot> mydatabase = await Future.wait(
        _user.map((e) => db.collection('users').document(e).get()));
    List<DocumentSnapshot> friendsData = await Future.wait(friendList
        .map((f) => db.collection('users').document(f.documentID).get()));

    friendsData.forEach((element) {
      print(element);
      friendsList.add(element);
    });
    friendsList.add(mydatabase.first);
    friendsList.sort((b, a) => a['rating'].compareTo(b['rating']));
    print(friendsList.first.documentID + "-" + friendsList.last.documentID);
    print(friendsList.length);
    position = (friendsList
                .indexWhere((element) => element.documentID == widget.userId) +
            1)
        .toString();
    print(position);
    setState(() {
      isDataFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<DashBoardProvider>(context).user;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    print(screenHeight * 0.06);
    return Scaffold(
        backgroundColor: primaryColor,
        body: !isDataFetched
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Loader(),
                ),
              )
            :
            /////////////////////////////////////////////////////////////
            Center(
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
                        Text(position,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.07,
                            )),
                      ],
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
                      child: ListView.builder(
                        itemCount: friendsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return LeaderCard();
                          }
                          return LeaderBoardCard();
                        },
                      ),
                    ),
                  ],
                ),
              )
        /////////////////////////////////////////////////////////////
        );
  }
}
