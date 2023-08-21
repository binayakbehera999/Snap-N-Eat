import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_n_eat/utils/constants.dart';

class Empty extends StatelessWidget {
  final String msg;
  Empty({this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          Text(
            msg,
            style: TextStyle(color: primaryColor, fontSize: 17),
          ),
          new SvgPicture.asset(
            "assets/icons/clear.svg",
            color: Colors.red,
            height: 60,
          )
        ],
      ),
    ));
  }
}
