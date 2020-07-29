import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/friendListTile.dart';
import 'package:snap_n_eat/components/friendrequesttiles.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  User userId;

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

  @override
  Widget build(BuildContext context) {
    userId = Provider.of<DashBoardProvider>(context, listen: false).user;
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance
            .collection("users")
            .document(userId.uid)
            .collection('Friends')
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Text('PLease Wait')
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot pendingRequests =
                        snapshot.data.documents[index];
                    print(pendingRequests.documentID);
                    return (pendingRequests != null)
                        ? FriendlistTile(
                            friendId: pendingRequests.documentID,
                            userId: userId.uid,
                          )
                        : Text("No Friends");
                  },
                );
        },
      ),
    );
  }
}
