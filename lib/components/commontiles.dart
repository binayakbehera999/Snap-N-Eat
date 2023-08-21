import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snap_n_eat/components/toast.dart';
import 'package:snap_n_eat/screens/arena.dart';
import 'package:snap_n_eat/utils/constants.dart';

class CommonTile extends StatefulWidget {
  final String friendId;
  final String userId;
  final String arguement;
  final String noOfDays;
  final int noOfCompleted;
  final double initialWeight;
  const CommonTile(
      {Key key,
      this.friendId,
      this.userId,
      this.arguement,
      this.noOfDays,
      this.initialWeight,
      this.noOfCompleted})
      : super(key: key);

  @override
  _CommonTileState createState() => _CommonTileState();
}

class _CommonTileState extends State<CommonTile> {
  TextEditingController noOfDaysTextController;
  TextEditingController ratingTextController;

  @override
  void initState() {
    super.initState();
    noOfDaysTextController = new TextEditingController();
    ratingTextController = new TextEditingController();
  }

  showChallengingDialogBox(BuildContext context) {
    showDialog(
        child: new Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Container(
            width: 300,
            height: 250,
            padding: EdgeInsets.all(15),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: new Text(
                    "Send Challenge",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'B612',
                      fontSize: 25,
                    ),
                  ),
                ),
                new TextField(
                  controller: noOfDaysTextController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: 'No of Days',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(32.0),
                    ),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(color: Colors.black),
                        )),
                    FlatButton(
                      onPressed: () {
                        String noOfDays = noOfDaysTextController.text;
                        sendChallenge(noOfDays);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Challenge',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        context: context);
  }

  showViewChallengingDialogBox(String noOfDays, BuildContext context) {
    showDialog(
        child: new Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Container(
            width: 300,
            height: 250,
            padding: EdgeInsets.all(15),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: new Text(
                    "View Challenge",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'B612',
                      fontSize: 25,
                    ),
                  ),
                ),
                Text("No of Days $noOfDays"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          rejectChallenge();
                          Navigator.pop(context, false);
                        },
                        child: Text(
                          'Reject',
                          style: TextStyle(color: Colors.black),
                        )),
                    FlatButton(
                      onPressed: () {
                        acceptChallenge(widget.noOfDays);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Accept',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        context: context);
  }

  sendChallenge(String noOfDays) {
    var db = Firestore.instance;
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());

    db
        .collection('users')
        .document(widget.friendId)
        .collection('pendingChallengeRequest')
        .document(widget.userId)
        .setData({'noOFDays': noOfDays, 'date': updatedDt},
            merge: true).whenComplete(() => {});
  }

  rejectChallenge() {
    var db = Firestore.instance;
    db
        .collection('users')
        .document(widget.friendId)
        .collection('pendingChallengeRequest')
        .document(widget.userId)
        .delete()
        .whenComplete(() => print("Challenge Rejected"));
  }

  acceptChallenge(String noOfDays) {
    var db = Firestore.instance;
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());

    db
        .collection('users')
        .document(widget.friendId)
        .collection('acceptedChallengeRequest')
        .document(widget.userId)
        .setData({'noOfDays': noOfDays, 'date': updatedDt},
            merge: true).whenComplete(() {
      db
          .collection('users')
          .document(widget.userId)
          .collection('acceptedChallengeRequest')
          .document(widget.friendId)
          .setData({'noOfDays': noOfDays, 'date': updatedDt},
              merge: true).whenComplete(() {
        db
            .collection('users')
            .document(widget.userId)
            .collection('pendingChallengeRequest')
            .document(widget.friendId)
            .delete()
            .whenComplete(() => print("Challenge Accpeted"));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(widget.friendId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // return Text("Please Wait!!!")
            ToastMsg.showToast("Please Wait");
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
              subtitle: Text(userDocument['rating'].toStringAsFixed(2)),
              trailing: RaisedButton(
                color: primaryColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: (widget.arguement == 'viewChallenge')
                    ? Text(
                        'View Challenge',
                        style: TextStyle(color: Colors.white),
                      )
                    : (widget.arguement == 'viewArena')
                        ? Text(
                            "Progress",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        : Text(
                            "Challenge !",
                            style: TextStyle(color: Colors.white),
                          ),
                onPressed: () {
                  (widget.arguement == 'viewChallenge')
                      ? showViewChallengingDialogBox(widget.noOfDays, context)
                      : (widget.arguement == 'viewArena')
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Arena(
                                        friendId: widget.friendId,
                                        user: widget.userId,
                                        noOfDays: int.parse(widget.noOfDays),
                                        noOfDaysCompleted: widget.noOfCompleted,
                                        intialWeight: widget.initialWeight,
                                      )))
                          : showChallengingDialogBox(context);
                },
              ),
            ),
          );
        });
  }
}
