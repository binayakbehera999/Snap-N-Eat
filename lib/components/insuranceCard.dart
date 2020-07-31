import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InsuranceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new SvgPicture.asset(
                      "assets/icon/list-box.svg",
                    ),
                    Column(children: <Widget>[
                      Text("Health Insurance"),
                      Text("Lorem")
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
