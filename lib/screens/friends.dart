import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/screens/friendlist.dart';

class FriendScreen extends StatefulWidget {
  FriendScreen({Key key}) : super(key: key);

  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(icon: new SvgPicture.asset("assets/icons/addFriend.svg")),
              Tab(icon: new SvgPicture.asset("assets/icons/friend.svg")),
              Tab(icon: new SvgPicture.asset("assets/icons/challenge.svg")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FriendList(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
