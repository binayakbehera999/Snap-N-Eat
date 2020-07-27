import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: Text(widget.name),
      leading: CircleAvatar(child: Image.network(widget.avatar)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: null,
            child: Icon(Icons.flight),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
          ),
          RaisedButton(
            onPressed: null,
            child: Icon(Icons.flight),
          ),
        ],
      ),
    );
  }
}
