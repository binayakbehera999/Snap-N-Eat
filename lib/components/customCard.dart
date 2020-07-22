import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCard extends StatefulWidget {
  final String iconSvg;
  final String value;
  final String unit;
  final bool percentageIndicator;
  final double height, width;
  CustomCard(
      {this.iconSvg,
      this.value,
      this.unit,
      this.percentageIndicator,
      this.height,
      this.width});
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Card(
        color: const Color(0xff2A347b),
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
              radius: 80.0,
              lineWidth: 10.0,
              animation: true,
              animationDuration: 1200,
              percent: 0.5,
              center: (widget.iconSvg.isNotEmpty)
                  ? SvgPicture.asset(widget.iconSvg,
                      color: Colors.white, semanticsLabel: 'A red up arrow')
                  : "assets/icons/profile.svg",
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: const Color(0xff2A347b),
              progressColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.value,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              widget.unit,
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 13,
                color: Colors.white,
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
