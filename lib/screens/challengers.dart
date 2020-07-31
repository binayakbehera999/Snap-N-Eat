import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/commontiles.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:snap_n_eat/utils/constants.dart';
import 'package:snap_n_eat/screens/pendingchallengerequest.dart';

class ChallengerScreen extends StatefulWidget {
  @override
  _ChallengerScreenState createState() => _ChallengerScreenState();
}

class _ChallengerScreenState extends State<ChallengerScreen> {
  User userId;

  @override
  Widget build(BuildContext context) {
    userId = Provider.of<DashBoardProvider>(context, listen: false).user;
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance
            .collection("users")
            .document(userId.uid)
            .collection('acceptedChallengeRequest')
            .snapshots(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("To View Your Pending Challenge Request"),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PendingChallengeRequest()));
                        },
                        child: Text("Click Here")),
                  ],
                ),
                !snapshot.hasData
                    ? Text('PLease Wait')
                    : (snapshot.data.documents.length == 0)
                        ? Text(" You are alone in the Race")
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot pendingRequests =
                                  snapshot.data.documents[index];
                              return CommonTile(
                                friendId: pendingRequests.documentID,
                                userId: userId.uid,
                                arguement: 'viewArena',
                              );
                            },
                          )
              ],
            ),
          );
        },
      ),
    );
  }
}
