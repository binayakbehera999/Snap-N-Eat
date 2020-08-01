import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';

class Empty extends StatelessWidget {
  final String msg;
  Empty({this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: EmptyListWidget(
          title: msg,
          image: 'assets/icons/spoiled.svg',
          titleTextStyle: Theme.of(context)
              .typography
              .dense
              .headline4
              .copyWith(color: Color(0xff9da9c7)),
          subtitleTextStyle: Theme.of(context)
              .typography
              .dense
              .bodyText1
              .copyWith(color: Color(0xffabb8d6))),
    );
  }
}
