import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/constants.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final name;
  final description;

  DetailsPage({this.heroTag, this.name, this.description});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 0.1
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight *0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(height: screenHeight *0.05,),
                      Text(
                        "${widget.name}",
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.04,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${widget.description}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          
                        ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0)),
                              color: Colors.black
                            ),
                            height: 50.0,
                            child: Center(
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenHeight *0.2,
              left: screenWidth *0.5 - 100,
              child: Hero(
                tag: widget.heroTag,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover
                      )
                    ),
                  height: 200.0,
                  width: 200.0
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
