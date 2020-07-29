import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendlistTile extends StatefulWidget {
  final String friendId;
  final String userId;
  const FriendlistTile({Key key, this.friendId, this.userId}) : super(key: key);

  @override
  _FriendlistTileState createState() => _FriendlistTileState();
}

class _FriendlistTileState extends State<FriendlistTile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(widget.friendId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Please Wait!!!");
          }
          var userDocument = snapshot.data;
          return Card(
            margin: EdgeInsets.all(10.0),
            shadowColor: Colors.grey,
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: new ListTile(
              title: Text(userDocument['fullName']),
              leading:
                  CircleAvatar(child: Image.network(userDocument['avatar'])),
              subtitle: Text(userDocument['rating'].toString()),
              trailing: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text('Challenge !'),
                onPressed: () {
                  print(widget.friendId);
                },
              ),
            ),
          );
        });
  }
}
