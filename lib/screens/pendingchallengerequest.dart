import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/components/commontiles.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:snap_n_eat/utils/constants.dart';

class PendingChallengeRequest extends StatefulWidget {
  @override
  _PendingChallengeRequestState createState() =>
      _PendingChallengeRequestState();
}

class _PendingChallengeRequestState extends State<PendingChallengeRequest> {
  User userId;

  @override
  Widget build(BuildContext context) {
    userId = Provider.of<DashBoardProvider>(context, listen: false).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("users")
            .document(userId.uid)
            .collection('pendingChallengeRequest')
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Text('PLease Wait')
              : (snapshot.data.documents.length == 0)
                  ? Text(" You Have No Friends")
                  : ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot pendingRequests =
                            snapshot.data.documents[index];
                        return CommonTile(
                          friendId: pendingRequests.documentID,
                          userId: userId.uid,
                          arguement: 'viewChallenge',
                          noOfDays:pendingRequests['noOfDays']
                        );
                      },
                    );
        },
      ),
    );
  }
}
