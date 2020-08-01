import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/screens/gameScreens/screen4.dart';
import 'package:snap_n_eat/utils/constants.dart';
import 'package:snap_n_eat/utils/gamePoints.dart';

class ScreenThree extends StatefulWidget {
  final Point point;
  ScreenThree({this.point});

  @override
  _ScreenThreeState createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    String _point = widget.point.point.toString();
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/gameImage/screen3.jpeg"),
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
                  child: InkWell(
                    onTap: () {
                      var pt = widget.point;
                      print(pt);
                      setState(() {
                        pt = Point(point: 750,previousChoice: 1);
                        
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenFour(point: pt)),
                      );
                    },
                    child: Container(
                      width: screenWidth - 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: primaryColor),
                      height: 50.0,
                      child: Center(
                        child: Text('Buy Insurance \$150',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      var pt = Point(point: 900, previousChoice:0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenFour(point: pt)),
                      );
                    },
                    child: Container(
                      width: screenWidth - 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: secondaryColor),
                      height: 50.0,
                      child: Center(
                        child: Text('No, Thanks',
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
          Positioned(
            right: 20,
            top: 40,
            child: Container(
              width: screenWidth * 0.3,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.attach_money,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    _point,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
