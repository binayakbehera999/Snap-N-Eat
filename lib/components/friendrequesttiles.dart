import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Card(
      shadowColor: Colors.grey,
      elevation: 15.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: new ListTile(
        title: Text(widget.name),
        leading: CircleAvatar(child: Image.network(widget.avatar)),
        trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              child: new SvgPicture.asset("assets/icons/check.svg"),
              shape: CircleBorder(),
            ),
            RaisedButton(
              onPressed: null,
              child: new SvgPicture.asset("assets/icons/clear.svg"),
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
