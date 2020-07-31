import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/friendrequesttiles.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:share/share.dart';
import 'package:snap_n_eat/utils/constants.dart';

class FriendRequest extends StatefulWidget {
  @override
  _FriendRequestState createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
  double height;
  double width;
  User userId;
  TextEditingController addFriendTextContoller;
  @override
  void initState() {
    super.initState();
    addFriendTextContoller = new TextEditingController();
  }

  @override
  void dispose() {
    addFriendTextContoller.dispose();
    super.dispose();
  }

  sendFriendRequest(String friendId) {
    var db = Firestore.instance;
    db
        .collection('users')
        .document(userId.uid)
        .collection('PendingFriendRequest')
        .document(friendId)
        .setData({
      'avatar': userId.avatar,
      'fullName': userId.fullName,
    },merge: true).whenComplete(() => print("Friend Request Send"));
  }

  acceptFriendRequest(String friendId) {
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());
    print(updatedDt);

    var db = Firestore.instance;

    db
        .collection('users')
        .document(userId.uid)
        .collection('Friends')
        .document(friendId)
        .setData({
      'Friend Since': updatedDt,
    },merge: true).whenComplete(() {
      db
          .collection('users')
          .document(friendId)
          .collection('Friends')
          .document(userId.uid)
          .setData({
        'Friend Since': updatedDt,
      },merge: true).whenComplete(() => print("Added Friend into FriendsList"));
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    userId = Provider.of<DashBoardProvider>(context).user;
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Container(
                height: height * 0.35,
                width: width - 20,
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(
                            " Add Friend",
                            style: TextStyle(
                                fontSize: 20,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Text(
                                " Your Code: " + userId.uid + '.',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RaisedButton(
                                color: Colors.white,
                                elevation: 0,
                                onPressed: () {
                                  print('Hello');
                                },
                                child: Icon(
                                  Icons.content_copy,
                                  size: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RaisedButton(
                                color: Colors.white,
                                elevation: 0,
                                onPressed: () {
                                  Share.share(
                                      'check out my website https://example.com');
                                },
                                child: Icon(
                                  Icons.share,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                        child: TextField(
                          controller: addFriendTextContoller,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            hintText: 'Enter Room ID...',
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(32.0),
                            ),
                            icon: Icon(
                              Icons.person_add,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            String friendId = addFriendTextContoller.text;
                            sendFriendRequest(friendId);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Send Friend Request",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Container(
              height: height * 0.4,
              width: width - 20,
              padding: EdgeInsets.all(10),
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection("users")
                    .document(userId.uid)
                    .collection('PendingFriendRequest')
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Column(children: <Widget>[
                          Text(
                            "Friend Requests",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('PLease Wait'),
                        ])
                      : Column(children: <Widget>[
                          Text(
                            "Friend Requests",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot pendingRequests =
                                  snapshot.data.documents[index];

                              return FriendRequestTiles(
                                name: pendingRequests['fullName'],
                                avatar: pendingRequests['avatar'],
                                friendId: pendingRequests.documentID,
                                userId: userId.uid,
                              );
                            },
                          ),
                        ]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
          ],
        ),
      ),
    );
  }
}
