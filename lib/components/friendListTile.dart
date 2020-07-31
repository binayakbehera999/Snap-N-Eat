import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snap_n_eat/utils/constants.dart';

class FriendlistTile extends StatefulWidget {
  final String friendId;
  final String userId;
  const FriendlistTile({Key key, this.friendId, this.userId}) : super(key: key);

  @override
  _FriendlistTileState createState() => _FriendlistTileState();
}

class _FriendlistTileState extends State<FriendlistTile> {
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
                new TextField(
                  controller: ratingTextController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: 'Rating',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(32.0),
                    ),
                    icon: const Icon(Icons.star),
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
                        String rating = ratingTextController.text;
                        sendChallenge(noOfDays, rating);
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

  sendChallenge(String noOfDays, String rating) {
    var db = Firestore.instance;
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());
    print(updatedDt);

    db
        .collection('users')
        .document(widget.friendId)
        .collection('pendingChallengeRequest')
        .document(widget.userId)
        .setData({
      'noOFDays': noOfDays,
      'rating': rating,
      'date': updatedDt
    },merge: true).whenComplete(() => print("Challenge Sent"));
  }

  acceptChallenge(String noOfDays, String rating) {
    var db = Firestore.instance;

    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(DateTime.now());
    print(updatedDt);

    db
        .collection('users')
        .document(widget.friendId)
        .collection('acceptedChallengeRequest')
        .document(widget.userId)
        .setData({
      'noOFDays': noOfDays,
      'rating': rating,
      'date': updatedDt
    },merge: true).whenComplete(() {
      db
          .collection('users')
          .document(widget.userId)
          .collection('acceptedChallengeRequest')
          .document(widget.friendId)
          .setData({
        'noOFDays': noOfDays,
        'rating': rating,
        'date': updatedDt
      },merge: true).whenComplete(() {
        db
            .collection('users')
            .document(widget.friendId)
            .collection('pendingChallengeRequest')
            .document(widget.userId)
            .delete()
            .whenComplete(() => print("Accepted Challenge "));
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
            return Text("Please Wait!!!");
          }
          var userDocument = snapshot.data;
          return Card(
            margin: EdgeInsets.all(10.0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: new ListTile(
              title: Text(
                userDocument['fullName'],
                style: TextStyle(
                  fontSize: 15,
                  color: primaryColor,
                ),
              ),
              leading:
                  CircleAvatar(child: Image.network(userDocument['avatar'])),
              subtitle: Text(
                userDocument['rating'].toString(),
                style: TextStyle(color: primaryColor, fontSize: 20),
              ),
              trailing: FlatButton(
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Text(
                  'Challenge !',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  showChallengingDialogBox(context);
                },
              ),
            ),
          );
        });
  }
}
