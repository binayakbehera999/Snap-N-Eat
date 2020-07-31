import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class FriendRequestTiles extends StatefulWidget {
  final String name;
  final String avatar;
  final String friendId;
  final String userId;

  const FriendRequestTiles(
      {Key key, this.name, this.avatar, this.friendId, this.userId});

  @override
  _FriendRequestTilesState createState() => _FriendRequestTilesState();
}

class _FriendRequestTilesState extends State<FriendRequestTiles> {
  acceptFriendRequest() {
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());
    print(updatedDt);

    var db = Firestore.instance;

    db
        .collection('users')
        .document(widget.userId)
        .collection('Friends')
        .document(widget.friendId)
        .setData({
      'Friend Since': updatedDt,
      'hasChallenged': false,
    }).whenComplete(() {
      db
          .collection('users')
          .document(widget.friendId)
          .collection('Friends')
          .document(widget.userId)
          .setData({
        'Friend Since': updatedDt,
        'hasChallenged': false,
      }).whenComplete(() {
        db
            .collection('users')
            .document(widget.userId)
            .collection('PendingFriendRequest')
            .document(widget.friendId)
            .delete()
            .whenComplete(() => print("Adds Friend List"));
      });
    });
  }

  cancelFriendRequest() {
    var db = Firestore.instance;

    db
        .collection('users')
        .document(widget.userId)
        .collection('PendingFriendRequest')
        .document(widget.friendId)
        .delete()
        .whenComplete(() => print("Friend Deleted"));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 15.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Card(
        elevation: 10,
        child: new ListTile(
          title: Text(widget.name),
          leading: CircleAvatar(child: Image.network(widget.avatar)),
          trailing: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () => acceptFriendRequest(),
                child: new SvgPicture.asset("assets/icons/check.svg",
                    color: Colors.white),
                shape: CircleBorder(),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: () => cancelFriendRequest(),
                child: new SvgPicture.asset("assets/icons/clear.svg",
                    color: Colors.white),
                shape: CircleBorder(),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
