import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/screens/challengers.dart';
import 'package:snap_n_eat/screens/friendlist.dart';
import 'package:snap_n_eat/screens/friendrequest.dart';
import 'package:snap_n_eat/utils/constants.dart';

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
          backgroundColor: Colors.white,
          title: TabBar(
            indicatorColor: primaryColor,
            tabs: [
              Tab(
                  icon: new SvgPicture.asset(
                "assets/icons/addFriend.svg",
                color: primaryColor,
              )),
              Tab(
                  icon: new SvgPicture.asset(
                "assets/icons/friend.svg",
                color: primaryColor,
              )),
              Tab(
                  icon: new SvgPicture.asset(
                "assets/icons/challenge.svg",
                color: primaryColor,
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FriendList(),
            FriendRequest(),
            ChallengerScreen(),
          ],
        ),
      ),
    );
  }
}
