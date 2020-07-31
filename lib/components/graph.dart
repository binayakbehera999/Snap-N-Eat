import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/constants.dart';

class Graph extends StatefulWidget {
  final List<DocumentSnapshot> user;
  final List<DocumentSnapshot> friend;
  final String viewMode;

  const Graph({
    Key key,
    this.viewMode,
    this.user,
    this.friend,
  }) : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    super.initState();
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 24,
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w100, fontSize: 13),
          getTitles: (value) {
            // print(value);
            switch (value.toInt()) {
              case 0:
                return widget.user[6].documentID.split('-').last;
              case 2:
                return widget.user[5].documentID.split('-').last;
              case 4:
                return widget.user[4].documentID.split('-').last;
              case 6:
                return widget.user[3].documentID.split('-').last;
              case 8:
                return widget.user[2].documentID.split('-').last;
              case 10:
                return widget.user[1].documentID.split('-').last;
              case 12:
                return widget.user[0].documentID.split('-').last;
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1';
              case 2:
                return '2';
              case 3:
                return '3';
              case 4:
                return '4';
              case 5:
                return '5';
            }
            return '';
          },
          reservedSize: 22,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData:
          (widget.viewMode == 'profile') ? viewProfile() : viewArena(),
    );
  }

  List<LineChartBarData> viewProfile() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(0, widget.user[6].data['rating'].toDouble()),
          FlSpot(2, widget.user[5].data['rating'].toDouble()),
          FlSpot(4, widget.user[4].data['rating'].toDouble()),
          FlSpot(6, widget.user[3].data['rating'].toDouble()),
          FlSpot(8, widget.user[2].data['rating'].toDouble()),
          FlSpot(10, widget.user[1].data['rating'].toDouble()),
          FlSpot(12, widget.user[0].data['rating'].toDouble()),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ];
  }

  List<LineChartBarData> viewArena() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(0, widget.user[6].data['rating'].toDouble()),
          FlSpot(2, widget.user[5].data['rating'].toDouble()),
          FlSpot(4, widget.user[4].data['rating'].toDouble()),
          FlSpot(6, widget.user[3].data['rating'].toDouble()),
          FlSpot(8, widget.user[2].data['rating'].toDouble()),
          FlSpot(10, widget.user[1].data['rating'].toDouble()),
          FlSpot(12, widget.user[0].data['rating'].toDouble()),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
      LineChartBarData(
        spots: [
          FlSpot(0, widget.friend[0].data['rating'].toDouble()),
          FlSpot(2, widget.friend[1].data['rating'].toDouble()),
          FlSpot(4, widget.friend[2].data['rating'].toDouble()),
          FlSpot(6, widget.friend[3].data['rating'].toDouble()),
          FlSpot(8, widget.friend[4].data['rating'].toDouble()),
          FlSpot(10, widget.friend[5].data['rating'].toDouble()),
          FlSpot(12, widget.friend[6].data['rating'].toDouble()),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;

    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: const [
              primaryColor,
              darkGradient,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text(
                  widget.viewMode + ' Data',
                  style: TextStyle(
                      color: lightGradient,
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      mainData(),
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
