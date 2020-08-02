import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/components/popUp.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/utils/constants.dart';
import 'package:snap_n_eat/utils/gamePoints.dart';

class Congrats extends StatefulWidget {
  final Point point;
  Congrats({this.point});

  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  ConfettiController _controller;

  @override
  void initState() {
    _controller = ConfettiController(duration: const Duration(seconds: 1));
    int _point = widget.point.point;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog(
          context: context,
          builder: (context) {
            // Future.delayed(Duration(seconds: 5), () {
            //   Navigator.of(context).pop(true);
            // });
            _controller.play();
            return CustomPopup(point: _point);
          });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[20],
      body: Center(
        child: ConfettiWidget(
          confettiController: _controller,
          blastDirectionality: BlastDirectionality.explosive,
          blastDirection: pi,
          shouldLoop: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  },
                  child: Container(
                    width: screenWidth - 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: primaryColor),
                    height: 50.0,
                    child: Center(
                      child: Text('The End',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
