import 'package:flutter/material.dart';
import 'package:snap_n_eat/screens/friendlist.dart';
import 'package:snap_n_eat/screens/friendrequest.dart';

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
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FriendList(),
              FriendRequest(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
    );
  }
}