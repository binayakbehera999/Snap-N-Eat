import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Widget _component;
  String dashboard =
      '<svg viewBox="0.0 0.0 33.5 35.7" ><path transform="translate(-16.0, 0.0)" d="M 41.1282844543457 0 L 41.1282844543457 33.64397430419922 L 36.94023513793945 33.64397430419922 L 36.94023513793945 8.51569652557373 L 28.56414222717285 8.51569652557373 L 28.56414222717285 33.64397430419922 L 24.37609481811523 33.64397430419922 L 24.37609481811523 16.89179229736328 L 16 16.89179229736328 L 16 33.64397430419922 L 16 35.73800277709961 L 24.37609481811523 35.73800277709961 L 28.56414222717285 35.73800277709961 L 36.94023513793945 35.73800277709961 L 41.1282844543457 35.73800277709961 L 49.5043830871582 35.73800277709961 L 49.5043830871582 33.64397430419922 L 49.5043830871582 0 L 41.1282844543457 0 Z" fill="#000000" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

  @override
  void initState() {
    _component = Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _component,
        bottomNavigationBar: FluidNavBar(
          icons: [],
        ),
      ),
    );
  }
}
