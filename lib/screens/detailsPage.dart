import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/constants.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final name;
  final Map<String, dynamic> description;

  DetailsPage({this.heroTag, this.name, this.description});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    Map<String, dynamic> _description = widget.description;
    String _detail = _description['description'];
    List<String> _benefits = _description['benefits'];
    String _eligibility = _description['eligibility'];
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: screenHeight * 0.1),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            height: screenHeight * 0.1,
                          ),
                          Text(
                            "${widget.name}",
                            style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.03,
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _detail,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                                child: Text(
                                  'Benefits: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "\u2022 ${_benefits[0]}",
                                      style: TextStyle(
                                          color: darkGradient,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "\u2022 ${_benefits[1]}",
                                      style: TextStyle(
                                          color: darkGradient,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "\u2022 ${_benefits[2]}",
                                      style: TextStyle(
                                          color: darkGradient,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "\u2022 ${_benefits[3]}",
                                      style: TextStyle(
                                          color: darkGradient,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                                child: Text(
                                  'Eligibility: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _eligibility,
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
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(25.0),
                                            bottomRight: Radius.circular(25.0)),
                                        color: Colors.black),
                                    height: 50.0,
                                    child: Center(
                                      child: Text('Buy Now',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: screenHeight * 0.03,
              left: screenWidth * 0.5 - 75,
              child: Hero(
                tag: widget.heroTag,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                            fit: BoxFit.cover)),
                    height: 150.0,
                    width: 150.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
