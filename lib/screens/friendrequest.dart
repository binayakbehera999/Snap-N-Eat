import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/friendrequesttiles.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:share/share.dart';

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
    }).whenComplete(() => print("Friend Request Send"));
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
    }).whenComplete(() {
      db
          .collection('users')
          .document(friendId)
          .collection('Friends')
          .document(userId.uid)
          .setData({
        'Friend Since': updatedDt,
      }).whenComplete(() => print("Added Friend into FriendsList"));
    });
  }

  // shareCode() {
  //   Share.share('check out my website https://example.com');
  // }

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
            Container(
              height: height * 0.3,
              width: width - 20,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(" Add Friend"),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(" Your Code is "),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                      ),
                      Text(
                        userId.uid + '.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RaisedButton(
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
                      RaisedButton(
                        color: Colors.white,
                        elevation: 0,
                        onPressed: () {
                          Share.share('check out my website https://example.com');
                          print('Hello');
                        },
                        child: Icon(
                          Icons.share,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  TextField(
                    controller: addFriendTextContoller,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      hintText: 'Enter Room ID...',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(32.0),
                      ),
                      icon: Icon(Icons.person_add),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      String friendId = addFriendTextContoller.text;
                      sendFriendRequest(friendId);
                    },
                    child: Text("Send Friend Request"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Container(
              height: height * 0.4,
              width: width - 20,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection("users")
                    .document(userId.uid)
                    .collection('PendingFriendRequest')
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Text('PLease Wait')
                      : ListView.builder(
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
                        );
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
