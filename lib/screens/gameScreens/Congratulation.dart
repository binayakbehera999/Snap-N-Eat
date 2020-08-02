import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/screens/insurance.dart';
import 'package:snap_n_eat/utils/constants.dart';
import 'package:snap_n_eat/utils/gamePoints.dart';

class Congrats extends StatefulWidget {
  final Point point;
  Congrats({this.point});

  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    int _point= widget.point.point;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/gameImage/champ.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 20,
            left: 20,
            bottom: 30,
            child: Column(
              children: <Widget>[
                Padding(
                  
                  padding: EdgeInsets.all(10),
                  child: RichText(
                    textAlign: TextAlign.center,
  text: new TextSpan(

    // Note: Styles for TextSpans must be explicitly defined.
    // Child text spans will inherit styles from parent
    style: new TextStyle(
      fontSize: 18.0,
      color: Colors.black,
    ),
    children: <TextSpan>[
      new TextSpan(text: 'Hey you are left with '),
      new TextSpan(text: '$_point', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: ' points, you can use this to get a discount on your next insurance purchase'),
    ],
  ),
 )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Insurance()),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          // Positioned(
          //   right: 20,
          //   top: 40,
          //   child: Container(
          //     width: screenWidth * 0.3,
          //     padding: EdgeInsets.all(12),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: primaryColor,
          //     ),
          //     child: Row(
          //       children: <Widget>[
          //         Icon(
          //           Icons.attach_money,
          //           color: Colors.amber,
          //         ),
          //         SizedBox(
          //           width: 15,
          //         ),
          //         Text(
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: screenHeight * 0.018,
          //               fontWeight: FontWeight.w500),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
