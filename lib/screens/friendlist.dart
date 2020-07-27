import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  
  @override
  Widget build(BuildContext context) {
    userId = Provider.of<DashBoardProvider>(context, listen: false).user;
    return Container(
        child: Center(
      child: RaisedButton(
        onPressed: () => sendFriendRequest("Hello World"),
        child: Text('Send Request'),
      ),
    ));
  }
}
