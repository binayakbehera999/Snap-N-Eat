import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCard extends StatefulWidget {
  final double cardHeight;
  final double cardWidth;
  final String iconSvg;
  final String value;
  final String unit;
  CustomCard({this.cardHeight, this.cardWidth,this.iconSvg,this.value,this.unit});
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.cardWidth,
        height: widget.cardWidth,
        child: Card(
          margin: EdgeInsets.all(5.0),
          shadowColor: Colors.grey,
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 10.0,
                animation: true,
                animationDuration: 1200,
                percent: 0.5,
                center: (widget.iconSvg.isNotEmpty)
                    ? SvgPicture.asset(
                        widget.iconSvg,
                        color: Colors.red,
                        semanticsLabel: 'A red up arrow'
                      )
                    : null,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              Text(
                  widget.value.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
              Text(
                  widget.unit,
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
            ],
          ),
        ),
    );
  }
}
