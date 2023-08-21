import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/constants.dart';

class CustomPopup extends StatefulWidget {
  final int point;
  CustomPopup({this.point});
  @override
  _CustomPopupState createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _assetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2));
    _assetAnimation = new CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut);
    _assetAnimation.addListener(() => this.setState(() {}));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: _assetAnimation,
          child: Container(
            height: screenHeight * 0.25,
            width: screenHeight * 0.35,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Congratulations!',
                    style: TextStyle(
                        fontSize: screenWidth / 15,
                        fontWeight: FontWeight.bold,
                        color: primaryColor
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'Hey you are left with '),
                          new TextSpan(
                            text: '${widget.point}',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          new TextSpan(
                            text:
                            ' points, you can use this to get a discount on your next insurance purchase'
                          ),
                        ],
                      ),
                    )
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      width: screenWidth / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: primaryColor),
                      height: screenWidth / 10,
                      child: Center(
                        child: Text('Collect',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
