import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

void main() {
  runApp(insuranceapp22());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OAuth auth;
  @override
  void initState() {
    super.initState();
    auth = new OAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Click on Me"),
          onPressed: () => auth.authorise(),
        ),
      ),
    );
  }
}

class insuranceapp22 extends StatelessWidget {
  insuranceapp22({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(40.0, 41.0),
            child: Stack(
              children: <Widget>[
                Text(
                  'Hello',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 17,
                    color: const Color(0xff29347b),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                Transform.translate(
                  offset: Offset(0.0, 24.0),
                  child: Text(
                    'Binayak',
                    style: TextStyle(
                      fontFamily: 'Typo Grotesk',
                      fontSize: 30,
                      color: const Color(0xff29347b),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-27.77, 797.24),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-0.23, 7.76),
                  child: SvgPicture.string(
                    _svg_rc6wcp,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Transform.translate(
                  offset: Offset(-0.23, -0.24),
                  child: Container(
                    width: 471.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(111.59, 814.33),
            child: SvgPicture.string(
              _svg_c9esln,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(188.0, 762.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: 39.0,
                      height: 38.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(19.5, 19.0)),
                        color: const Color(0x3d000000),
                      ),
                    ),
                    Positioned(
                      left: -4.0,
                      top: -4.0,
                      width: 47.0,
                      height: 46.0,
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          child: Container(color: const Color(0x00000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(188.0, 760.0),
                child: Container(
                  width: 39.0,
                  height: 38.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(19.5, 19.0)),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(197.27, 767.4),
            child:
                // Adobe XD layer: 'Icon material-camera' (shape)
                SvgPicture.string(
              _svg_aevsdy,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(46.0, 381.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: 143.0,
                      height: 207.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: const Color(0x4d29347b),
                      ),
                    ),
                    Positioned(
                      left: -8.0,
                      top: -8.0,
                      width: 159.0,
                      height: 223.0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: Container(color: const Color(0x00000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(40.0, 374.0),
                child: Container(
                  width: 142.0,
                  height: 207.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(60.92, 399.61),
            child:
                // Adobe XD layer: 'Icon awesome-heartb…' (shape)
                SvgPicture.string(
              _svg_ddyqic,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(62.41, 459.38),
            child: Stack(
              children: <Widget>[
                SvgPicture.string(
                  _svg_qrs0c9,
                  allowDrawingOutsideViewBox: true,
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(68.0, 535.0),
            child: Text(
              'Scores',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 12,
                color: const Color(0xff494848),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(68.0, 508.0),
            child: Text(
              '85',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 18,
                color: const Color(0xff333333),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(45.0, 149.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: 143.0,
                      height: 208.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: const Color(0x4d29347b),
                      ),
                    ),
                    Positioned(
                      left: -8.0,
                      top: -8.0,
                      width: 159.0,
                      height: 224.0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: Container(color: const Color(0x00000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(40.0, 141.0),
                child: Container(
                  width: 142.0,
                  height: 210.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xff29347b),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(67.47, 187.62),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(29.82, 25.33),
                  child:
                      // Adobe XD layer: 'Icon metro-fire' (shape)
                      SvgPicture.string(
                    _svg_35o40x,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.0, 0.0),
                  child: Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-0.47, 0.38),
                        child: SvgPicture.string(
                          _svg_foy4xc,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(131.0, 301.0),
            child: Text(
              'kcal',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 13,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(136.0, 273.0),
            child: Text(
              '31',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 18,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(36.0, 605.97),
                child: SvgPicture.string(
                  _svg_i947rk,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(50.7, 640.91),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, 0.0),
                  child: Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0.3, 0.09),
                        child:
                            // Adobe XD layer: 'Icon material-direc…' (shape)
                            SvgPicture.string(
                          _svg_db9qa7,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(35.79, 4.41),
                  child: SvgPicture.string(
                    _svg_3mqiaq,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(135.0, 695.0),
            child: Text(
              'kms',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 13,
                color: const Color(0xff494848),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(135.0, 668.0),
            child: Text(
              '2',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 16,
                color: const Color(0xff333333),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(233.0, 146.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: 148.0,
                      height: 126.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: const Color(0x4d29347b),
                      ),
                    ),
                    Positioned(
                      left: -8.0,
                      top: -8.0,
                      width: 164.0,
                      height: 142.0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: Container(color: const Color(0x00000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(226.0, 141.0),
                child: Container(
                  width: 147.0,
                  height: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(290.0, 237.0),
            child: Text(
              'hrs',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 12,
                color: const Color(0xff494848),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(291.98, 165.92),
            child:
                // Adobe XD layer: 'Icon ionic-ios-moon' (shape)
                SvgPicture.string(
              _svg_r4yt40,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(296.0, 210.0),
            child: Text(
              '6',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 16,
                color: const Color(0xff333333),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(233.0, 601.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: 148.0,
                      height: 154.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: const Color(0x4d29347b),
                      ),
                    ),
                    Positioned(
                      left: -8.0,
                      top: -8.0,
                      width: 164.0,
                      height: 170.0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: Container(color: const Color(0x00000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(226.0, 598.0),
                child: Container(
                  width: 147.0,
                  height: 152.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(285.0, 715.0),
            child: Text(
              'floors',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 12,
                color: const Color(0xff494848),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(285.0, 688.0),
            child: Text(
              '10',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 18,
                color: const Color(0xff333333),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(285.5, 632.91),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-2.65, -0.67),
                  child: Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0.0, 0.0),
                        child:
                            // Adobe XD layer: 'graph' (group)
                            Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                SvgPicture.string(
                                  _svg_65wo0g,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(7.15, 15.76),
                        child: Container(
                          width: 11.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: const Color(0x80000000),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(19.59, 8.52),
                        child: SvgPicture.string(
                          _svg_ji38qh,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(-0.5, 0.09),
                  child: Container(
                    width: 31.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      color: const Color(0x80ffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0x80707070)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(231.0, 297.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: 148.0,
                      height: 278.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: const Color(0x4d29347b),
                      ),
                    ),
                    Positioned(
                      left: -8.0,
                      top: -8.0,
                      width: 164.0,
                      height: 294.0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: Container(color: const Color(0x00000000)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(226.0, 293.0),
                child: Container(
                  width: 147.0,
                  height: 276.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(288.18, 386.62),
            child:
                // Adobe XD layer: 'foot' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, 0.0),
                  child: SvgPicture.string(
                    _svg_6xxtlx,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(279.0, 460.0),
            child: Text(
              '7,235',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 15,
                color: const Color(0xff333333),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(256.23, 358.23),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-0.23, -0.23),
                  child: SvgPicture.string(
                    _svg_e7qmdg,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(281.0, 487.0),
            child: Text(
              'Scores',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 12,
                color: const Color(0xff494848),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(351.77, 77.5),
            child:
                // Adobe XD layer: 'Icon material-dashb…' (shape)
                SvgPicture.string(
              _svg_fz6w0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_rc6wcp =
    '<svg viewBox="-0.2 7.8 471.0 90.0" ><path transform="translate(-0.23, 7.76)" d="M 446.9994506835938 89.99909973144531 L 24.00033569335938 89.99909973144531 C 17.58980560302734 89.99909973144531 11.56262969970703 87.5028076171875 7.029041767120361 82.97010040283203 C 2.496277093887329 78.43739318847656 -1.70252187672304e-05 72.41021728515625 -1.70252187672304e-05 65.99880218505859 L -1.70252187672304e-05 59.06427764892578 L -1.70252187672304e-05 39.54245376586914 C 0.1466888636350632 49.31874847412109 8.220512390136719 57.27239227294922 17.9999828338623 57.27239227294922 L 109.8090438842773 57.27239227294922 C 119.7342147827148 57.27239227294922 127.8089828491211 49.19762802124023 127.8089828491211 39.27239227294922 L 127.8089828491211 35.06398391723633 C 127.8899841308594 30.31215858459473 128.8995666503906 25.71257019042969 130.8096313476563 21.39298248291016 C 132.6582183837891 17.21339416503906 135.2708129882813 13.4640998840332 138.5748138427734 10.24921703338623 C 141.8820953369141 7.031923294067383 145.7198028564453 4.507746696472168 149.9813995361328 2.746805667877197 C 154.3936309814453 0.9235703349113464 159.0777435302734 -0.0009002685546875 163.9035186767578 -0.0009002685546875 C 168.7286834716797 -0.0009002685546875 173.4124603271484 0.9235703349113464 177.8246917724609 2.746805667877197 C 182.0868072509766 4.508335113525391 185.9245758056641 7.032511711120605 189.2313385009766 10.24921703338623 C 192.5358123779297 13.46451187133789 195.1481018066406 17.21380615234375 196.9956359863281 21.39298248291016 C 198.9068603515625 25.71398162841797 199.9152221679688 30.31357002258301 199.9926300048828 35.06398391723633 L 200.0330963134766 35.06398391723633 C 200.0095672607422 35.64115905761719 199.9971008300781 36.23068618774414 199.9971008300781 36.81721878051758 C 199.9971008300781 59.69686508178711 218.6110382080078 78.31080627441406 241.4906921386719 78.31080627441406 L 438.9741516113281 78.31080627441406 C 451.4067993164063 78.31080627441406 463.0796813964844 72.80374908447266 470.999755859375 63.20162963867188 L 470.999755859375 65.99880218505859 C 470.999755859375 72.40956878662109 468.503173828125 78.43674468994141 463.9698181152344 82.97010040283203 C 459.4362182617188 87.5028076171875 453.4093322753906 89.99909973144531 446.9994506835938 89.99909973144531 Z" fill="#29347b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c9esln =
    '<svg viewBox="111.6 814.3 191.4 48.4" ><path transform="translate(182.59, 814.33)" d="M 24.20657157897949 0 C 37.57549285888672 0 48.41314315795898 10.83765125274658 48.41314315795898 24.20657157897949 C 48.41314315795898 37.57549285888672 37.57549285888672 48.41314315795898 24.20657157897949 48.41314315795898 C 10.83765125274658 48.41314315795898 0 37.57549285888672 0 24.20657157897949 C 0 10.83765125274658 10.83765125274658 0 24.20657157897949 0 Z" fill="#29347b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(111.59, 814.33)" d="M 24.20657157897949 0 C 37.57549285888672 0 48.41314315795898 10.83765125274658 48.41314315795898 24.20657157897949 C 48.41314315795898 37.57549285888672 37.57549285888672 48.41314315795898 24.20657157897949 48.41314315795898 C 10.83765125274658 48.41314315795898 0 37.57549285888672 0 24.20657157897949 C 0 10.83765125274658 10.83765125274658 0 24.20657157897949 0 Z" fill="#29347b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(254.62, 814.33)" d="M 24.20657157897949 0 C 37.57549285888672 0 48.41314315795898 10.83765125274658 48.41314315795898 24.20657157897949 C 48.41314315795898 37.57549285888672 37.57549285888672 48.41314315795898 24.20657157897949 48.41314315795898 C 10.83765125274658 48.41314315795898 0 37.57549285888672 0 24.20657157897949 C 0 10.83765125274658 10.83765125274658 0 24.20657157897949 0 Z" fill="#29347b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(118.61, 821.58)" d="M 17.01984405517578 3.375000476837158 C 9.482379913330078 3.375000476837158 3.375000476837158 9.482379913330078 3.375000476837158 17.01984405517578 C 3.375000476837158 24.55730819702148 9.482379913330078 30.66468620300293 17.01984405517578 30.66468620300293 C 24.55730819702148 30.66468620300293 30.66468620300293 24.55730819702148 30.66468620300293 17.01984405517578 C 30.66468620300293 9.482379913330078 24.55730819702148 3.375000476837158 17.01984405517578 3.375000476837158 Z M 5.211806774139404 17.01984405517578 C 5.211806774139404 13.86447429656982 6.438530445098877 10.89934349060059 8.668936729431152 8.668936729431152 C 10.89934349060059 6.438531398773193 13.86447429656982 5.211806774139404 17.01984405517578 5.211806774139404 C 20.17521476745605 5.211806774139404 23.14034461975098 6.438531398773193 25.37074851989746 8.668936729431152 C 27.48307991027832 10.78126430511475 28.69668388366699 13.55615425109863 28.82132148742676 16.52128410339355 C 28.24404144287109 15.84560203552246 27.23379898071289 14.94687843322754 25.94803619384766 14.94687843322754 C 24.14402961730957 14.94687843322754 23.21250152587891 16.63280296325684 22.6024227142334 17.74800491333008 C 22.51058006286621 17.91200828552246 22.42530250549316 18.06944847106934 22.34658050537109 18.20720863342285 C 21.59873962402344 19.46673202514648 20.55569267272949 20.17521476745605 19.55857276916504 20.10305786132813 C 18.67952728271484 20.04401588439941 17.93168640136719 19.36833572387695 17.44624328613281 18.21376991271973 C 16.84272193908691 16.76400756835938 15.537278175354 15.20928001403809 13.97599411010742 14.98624134063721 C 13.23471260070801 14.8812780380249 12.13262557983398 15.03872013092041 11.04366302490234 16.39008331298828 C 10.83374118804932 16.65248680114746 10.59102058410645 17.00672721862793 10.31550025939941 17.41344833374023 C 9.633258819580078 18.43025207519531 8.596774101257324 19.95873260498047 7.816133975982666 20.08993721008301 C 6.681250095367432 20.27361488342285 5.78908634185791 19.59793281555176 5.428285121917725 19.28305244445801 C 5.283966064453125 18.5483341217041 5.211806774139404 17.78736686706543 5.211806774139404 17.01984405517578 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(190.22, 820.95)" d="M 17.16970062255859 3.000000238418579 C 9.348027229309082 3.000000238418579 3.000000238418579 9.348027229309082 3.000000238418579 17.16970062255859 C 3.000000238418579 24.99137306213379 9.348026275634766 31.33939933776855 17.16970062255859 31.33939933776855 C 24.99137306213379 31.33939933776855 31.33939933776855 24.99137306213379 31.33939933776855 17.16970062255859 C 31.33939933776855 9.348026275634766 24.99137306213379 3.000000238418579 17.16970062255859 3.000000238418579 Z M 17.16970062255859 7.25091028213501 C 19.52187156677246 7.25091028213501 21.42061042785645 9.149650573730469 21.42061042785645 11.50182151794434 C 21.42061042785645 13.85399150848389 19.52187156677246 15.75273132324219 17.16970062255859 15.75273132324219 C 14.81753063201904 15.75273132324219 12.91879177093506 13.85399150848389 12.91879177093506 11.50182151794434 C 12.91879177093506 9.149650573730469 14.81753063201904 7.25091028213501 17.16970062255859 7.25091028213501 Z M 17.16970062255859 27.37188339233398 C 13.62727642059326 27.37188339233398 10.49577331542969 25.55816268920898 8.667881011962891 22.80924224853516 C 8.710390090942383 19.98946952819824 14.33576107025146 18.44497108459473 17.16970062255859 18.44497108459473 C 19.98946952819824 18.44497108459473 25.6290111541748 19.98946952819824 25.67152214050293 22.80924034118652 C 23.84362983703613 25.55816078186035 20.71212387084961 27.37188339233398 17.16970062255859 27.37188339233398 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(265.29, 821.64)" d="M 22.95278167724609 4.499999523162842 L 6.645671844482422 4.499999523162842 C 5.460670948028564 4.499999523162842 4.499999523162842 5.668644428253174 4.499999523162842 7.110330104827881 L 4.499999523162842 26.94883728027344 C 4.499999523162842 28.39052581787109 5.460670948028564 29.55916976928711 6.645671844482422 29.55916976928711 L 22.95278167724609 29.55916976928711 C 24.13783645629883 29.55916976928711 25.09845352172852 28.39052581787109 25.09845352172852 26.94883728027344 L 25.09845352172852 7.110330104827881 C 25.09845352172852 5.668644428253174 24.13783645629883 4.499999523162842 22.95278167724609 4.499999523162842 Z M 17.37403297424316 24.33851051330566 L 8.79134464263916 24.33851051330566 L 8.79134464263916 21.20611190795898 L 17.37403297424316 21.20611190795898 L 17.37403297424316 24.33851051330566 Z M 20.80710792541504 18.59578514099121 L 8.79134464263916 18.59578514099121 L 8.79134464263916 15.46338558197021 L 20.80710792541504 15.46338558197021 L 20.80710792541504 18.59578514099121 Z M 20.80710792541504 12.85305595397949 L 8.79134464263916 12.85305595397949 L 8.79134464263916 9.720660209655762 L 20.80710792541504 9.720660209655762 L 20.80710792541504 12.85305595397949 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aevsdy =
    '<svg viewBox="197.3 767.4 20.8 20.8" ><path transform="translate(194.27, 764.4)" d="M 10.71169281005859 11.85802459716797 L 15.68260765075684 3.25010871887207 C 14.95312309265137 3.093791246414185 14.20279502868652 3.000000476837158 13.42120552062988 3.000000476837158 C 10.92011642456055 3.000000476837158 8.627450942993164 3.885802030563354 6.835003852844238 5.344771385192871 L 10.6491641998291 11.96223640441895 L 10.71169281005859 11.85802459716797 Z M 23.363037109375 10.29484462738037 C 22.4042854309082 7.251851558685303 20.08035850524902 4.813290119171143 17.11031150817871 3.687799692153931 L 13.29615020751953 10.29484462738037 L 23.36303329467773 10.29484462738037 Z M 23.63398933410645 11.33696460723877 L 15.8285026550293 11.33696460723877 L 16.13071823120117 11.85802459716797 L 21.09121322631836 20.45551872253418 C 22.80028915405273 18.60054397583008 23.84241104125977 16.14113998413086 23.84241104125977 13.42120552062988 C 23.84241104125977 12.70214366912842 23.76946258544922 12.01434326171875 23.63398933410645 11.33696460723877 Z M 9.815469741821289 13.42120552062988 L 5.751198768615723 6.386892318725586 C 4.052542209625244 8.241866111755371 3.000000476837158 10.70127201080322 3.000000476837158 13.42120552062988 C 3.000000476837158 14.14026737213135 3.072948694229126 14.82806968688965 3.20842456817627 15.50544834136963 L 11.01390743255615 15.50544834136963 L 9.815469741821289 13.42120552062988 Z M 3.479376077651978 16.54756736755371 C 4.438127517700195 19.59056091308594 6.76205587387085 22.02912139892578 9.732099533081055 23.15461349487305 L 13.54626083374023 16.54756736755371 L 3.479375600814819 16.54756736755371 Z M 15.22407531738281 16.54756736755371 L 11.15980434417725 23.59230422973633 C 11.88928890228271 23.74861907958984 12.63961601257324 23.84241104125977 13.42120552062988 23.84241104125977 C 15.92229461669922 23.84241104125977 18.21495819091797 22.95660972595215 20.00740623474121 21.49763870239258 L 16.19324684143066 14.8801736831665 L 15.22407341003418 16.54756736755371 Z" fill="#29347b" fill-opacity="0.93" stroke="none" stroke-width="1" stroke-opacity="0.93" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qrs0c9 =
    '<svg viewBox="0.0 0.0 96.3 36.7" ><path transform="translate(-267.49, -785.97)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 812.1679077148438" fill="none" fill-opacity="0.35" stroke="#29347b" stroke-width="3" stroke-opacity="0.35" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-257.86, -794.64)" d="M 267.4894714355469 796.5001831054688 L 267.4894714355469 826.2305297851563" fill="none" stroke="#29347b" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-248.23, -782.89)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 806.00341796875" fill="none" stroke="#29347b" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-238.59, -788.76)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 817.7544555664063" fill="none" stroke="#29347b" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-228.96, -785.97)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 812.1679077148438" fill="none" fill-opacity="0.77" stroke="#29347b" stroke-width="3" stroke-opacity="0.77" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-219.33, -784.17)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 808.5719604492188" fill="none" stroke="#29347b" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-209.7, -796.5)" d="M 267.4894714355469 796.4999389648438 L 267.4894714355469 833.2294311523438" fill="none" stroke="#29347b" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-200.07, -791.36)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 822.9556274414063" fill="none" fill-opacity="0.27" stroke="#29347b" stroke-width="3" stroke-opacity="0.27" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-190.43, -792.9)" d="M 267.4894714355469 796.5000610351563 L 267.4894714355469 826.0376586914063" fill="none" stroke="#29347b" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-180.8, -782.89)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 806.00341796875" fill="none" fill-opacity="0.59" stroke="#29347b" stroke-width="3" stroke-opacity="0.59" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(-171.17, -788.76)" d="M 267.4894714355469 796.5001220703125 L 267.4894714355469 817.7544555664063" fill="none" stroke="#29347b" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_ddyqic =
    '<svg viewBox="60.9 399.6 28.4 26.7" ><path transform="translate(60.92, 397.37)" d="M 17.7405948638916 14.86007022857666 L 14.9869441986084 20.77836418151855 C 14.65451431274414 21.49880027770996 13.69045829772949 21.47498512268066 13.3857307434082 20.74264144897461 L 10.23315906524658 13.22271537780762 L 8.57099723815918 17.49174690246582 L 3.357347249984741 17.49174690246582 L 13.46883678436279 28.59599113464355 C 13.86221408843994 29.03063774108887 14.4993782043457 29.03063774108887 14.89275741577148 28.59599113464355 L 25.00978660583496 17.49174690246582 L 18.96505546569824 17.49174690246582 L 17.7405948638916 14.86007022857666 Z M 26.24532699584961 4.744194984436035 L 26.11235237121582 4.595344543457031 C 23.25897407531738 1.463531136512756 18.58829689025879 1.463531136512756 15.72937679290771 4.595344543457031 L 14.18356800079346 6.298194408416748 L 12.63775444030762 4.601298809051514 C 9.78437614440918 1.463531374931335 5.108159065246582 1.463531374931335 2.254778385162354 4.601298809051514 L 2.121806144714355 4.744194984436035 C -0.5764380097389221 7.709295272827148 -0.692789614200592 12.43083190917969 1.717346549034119 15.58646106719971 L 7.390862464904785 15.58646106719971 L 9.379918098449707 10.45409679412842 C 9.679104804992676 9.686027526855469 10.68748474121094 9.668167114257813 11.00883483886719 10.4302806854248 L 14.23343086242676 18.12882614135742 L 16.94829750061035 12.29984092712402 C 17.27519035339355 11.59726810455322 18.20599937438965 11.59726810455322 18.53289222717285 12.29984092712402 L 20.06208229064941 15.58645725250244 L 26.64978981018066 15.58645725250244 C 29.05992698669434 12.43083095550537 28.94357681274414 7.709295272827148 26.24532699584961 4.744193553924561 Z" fill="#000000" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_foy4xc =
    '<svg viewBox="-0.5 0.4 78.0 78.0" ><path transform="translate(-0.47, 0.38)" d="M 39 78 C 33.7349739074707 78 28.62747001647949 76.96886444091797 23.81937026977539 74.93522644042969 C 19.17525863647461 72.970947265625 15.00443267822266 70.158935546875 11.42275905609131 66.57726287841797 C 7.841085433959961 62.99558258056641 5.029058933258057 58.82476043701172 3.064790487289429 54.1806526184082 C 1.031146168708801 49.37254333496094 0 44.26504516601563 0 39 C 0 33.7349739074707 1.031146168708801 28.62747001647949 3.064790487289429 23.81937026977539 C 5.029058933258057 19.17525863647461 7.841085433959961 15.00443267822266 11.42275905609131 11.42275905609131 C 15.00443267822266 7.841085433959961 19.17525863647461 5.029058933258057 23.81937026977539 3.064790487289429 C 28.62747001647949 1.031146168708801 33.7349739074707 0 39 0 C 44.26504516601563 0 49.37254333496094 1.031146168708801 54.1806526184082 3.064790487289429 C 58.82476043701172 5.029058933258057 62.99558258056641 7.841085433959961 66.57726287841797 11.42275905609131 C 70.158935546875 15.00443267822266 72.970947265625 19.17525863647461 74.93522644042969 23.81937026977539 C 76.96886444091797 28.62747001647949 78 33.7349739074707 78 39 C 78 44.26504516601563 76.96886444091797 49.37254333496094 74.93522644042969 54.1806526184082 C 72.970947265625 58.82476043701172 70.158935546875 62.99558258056641 66.57726287841797 66.57726287841797 C 62.99558258056641 70.158935546875 58.82476043701172 72.970947265625 54.1806526184082 74.93522644042969 C 49.37254333496094 76.96886444091797 44.26504516601563 78 39 78 Z M 39 10.02854442596436 C 23.02509117126465 10.02854442596436 10.02854442596436 23.02509117126465 10.02854442596436 39 C 10.02854442596436 54.97492218017578 23.02509117126465 67.97147369384766 39 67.97147369384766 C 54.97492218017578 67.97147369384766 67.97147369384766 54.97492218017578 67.97147369384766 39 C 67.97147369384766 23.02509117126465 54.97492218017578 10.02854442596436 39 10.02854442596436 Z" fill="#ffffff" fill-opacity="0.38" stroke="none" stroke-width="1" stroke-opacity="0.38" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-276.51, -186.67)" d="M 318.1360778808594 190.8389892578125 C 335.8819580078125 190.8389892578125 350.2679748535156 205.8573760986328 350.2679748535156 224.3843994140625 C 350.2679748535156 234.8055114746094 345.7165832519531 244.1160888671875 338.5746765136719 250.2692565917969 C 336.1946411132813 252.3200073242188 333.5264892578125 254.0196228027344 330.6432800292969 255.2927856445313" fill="none" stroke="#ffffff" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_35o40x =
    '<svg viewBox="29.8 25.3 20.8 24.0" ><path transform="translate(25.12, 23.4)" d="M 10.56460189819336 25.91694259643555 C 8.965824127197266 22.59017181396484 9.817243576049805 20.68394088745117 11.0460205078125 18.88791275024414 C 12.39165019989014 16.92110061645508 12.73845672607422 14.97411346435547 12.73845672607422 14.97411346435547 C 12.73845672607422 14.97411346435547 13.79626750946045 16.3492546081543 13.37313652038574 18.5000114440918 C 15.24193000793457 16.41972351074219 15.59454727172852 13.10531997680664 15.31243991851807 11.83596801757813 C 19.53660011291504 14.78801250457764 21.34190559387207 21.17983627319336 18.9089527130127 25.91694259643555 C 31.84920501708984 18.59536361694336 22.12772941589355 7.640111446380615 20.43529510498047 6.406039237976074 C 20.99945640563965 7.640066146850586 21.10642433166504 9.729113578796387 19.96676635742188 10.74292850494385 C 18.03752708435059 3.427339315414429 13.26738834381104 1.928031444549561 13.26738834381104 1.928031444549561 C 13.8315486907959 5.70075798034668 11.22233009338379 9.826192855834961 8.706306457519531 12.90881443023682 C 8.617893218994141 11.40444660186768 8.523998260498047 10.36636829376221 7.732926368713379 8.926751136779785 C 7.555351734161377 11.65961074829102 5.466816425323486 13.88729953765869 4.901249885559082 16.62540817260742 C 4.135149002075195 20.33352661132813 5.475131511688232 23.04853439331055 10.56460189819336 25.91694259643555 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i947rk =
    '<svg viewBox="36.0 606.0 150.9 149.1" ><path transform="translate(43.98, 612.62)" d="M 19.21193313598633 0 L 123.6768112182617 0 C 134.2872619628906 0 142.8887329101563 7.449317932128906 142.8887329101563 16.63851737976074 L 142.8887329101563 125.8287811279297 C 142.8887329101563 135.0179901123047 134.2872619628906 142.4673004150391 123.6768112182617 142.4673004150391 L 19.21193313598633 142.4673004150391 C 8.601473808288574 142.4673004150391 0 135.0179901123047 0 125.8287811279297 L 0 16.63851737976074 C 0 7.449317932128906 8.601473808288574 0 19.21193313598633 0 Z" fill="#29347b" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(36.0, 605.97)" d="M 19.21193313598633 0 L 123.6768112182617 0 C 134.2872619628906 0 142.8887329101563 7.449317932128906 142.8887329101563 16.63851737976074 L 142.8887329101563 125.8287811279297 C 142.8887329101563 135.0179901123047 134.2872619628906 142.4673004150391 123.6768112182617 142.4673004150391 L 19.21193313598633 142.4673004150391 C 8.601473808288574 142.4673004150391 0 135.0179901123047 0 125.8287811279297 L 0 16.63851737976074 C 0 7.449317932128906 8.601473808288574 0 19.21193313598633 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_db9qa7 =
    '<svg viewBox="0.3 0.1 72.0 72.0" ><path transform="translate(17.92, 19.95)" d="M 19.00395965576172 7.585443019866943 C 20.47120475769043 7.585443019866943 21.67168426513672 6.384970188140869 21.67168426513672 4.917721271514893 C 21.67168426513672 3.450474500656128 20.47120475769043 2.25 19.00395965576172 2.25 C 17.53670883178711 2.25 16.33623695373535 3.450474500656128 16.33623695373535 4.917721271514893 C 16.33623695373535 6.384970188140869 17.53670883178711 7.585443019866943 19.00395965576172 7.585443019866943 Z M 14.06867027282715 12.12056922912598 L 10.33385848999023 30.92800712585449 L 13.13496589660645 30.92800712585449 L 15.53591632843018 20.25711822509766 L 18.33703231811523 22.92484474182129 L 18.33703231811523 30.92800712585449 L 21.0047492980957 30.92800712585449 L 21.0047492980957 20.92405319213867 L 18.20363998413086 18.2563304901123 L 19.00395965576172 14.25474834442139 C 20.73798370361328 16.25553894042969 23.40570259094238 17.58939933776855 26.34019470214844 17.58939933776855 L 26.34019470214844 14.92167949676514 C 23.80586624145508 14.92167949676514 21.67168426513672 13.58781719207764 20.60459136962891 11.72041320800781 L 19.27073287963867 9.586234092712402 C 18.73718452453613 8.785918235778809 17.93687057495117 8.252372741699219 17.00316619873047 8.252372741699219 C 16.60300445556641 8.252372741699219 16.33623695373535 8.385760307312012 15.93607616424561 8.385760307312012 L 9 11.32025527954102 L 9 17.58939933776855 L 11.66772079467773 17.58939933776855 L 11.66772079467773 13.054274559021 L 14.06867027282715 12.12056732177734" fill="#333333" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.3, 0.09)" d="M 36 72 C 31.13997268676758 72 26.42535400390625 71.04817199707031 21.98710632324219 69.17096710205078 C 17.70023345947266 67.35779571533203 13.85024261474609 64.76207733154297 10.54408359527588 61.45592498779297 C 7.237923622131348 58.14975738525391 4.642208576202393 54.29976654052734 2.829037189483643 50.01289749145508 C 0.951827347278595 45.57464599609375 2.562110239523463e-07 40.86003112792969 2.562110239523463e-07 36 C 2.562110239523463e-07 31.13997268676758 0.951827347278595 26.42535400390625 2.829037189483643 21.98710632324219 C 4.642208576202393 17.70023345947266 7.237923622131348 13.85024261474609 10.54408359527588 10.54408359527588 C 13.85024261474609 7.237923622131348 17.70023345947266 4.642208576202393 21.98710632324219 2.829037189483643 C 26.42535400390625 0.951827347278595 31.13997268676758 2.562110239523463e-07 36 2.562110239523463e-07 C 40.86003112792969 2.562110239523463e-07 45.57464599609375 0.951827347278595 50.01289749145508 2.829037189483643 C 54.29976654052734 4.642208576202393 58.14975738525391 7.237923622131348 61.45592498779297 10.54408359527588 C 64.76207733154297 13.85024261474609 67.35779571533203 17.70023345947266 69.17096710205078 21.98710632324219 C 71.04817199707031 26.42535400390625 72 31.13997268676758 72 36 C 72 40.86003112792969 71.04817199707031 45.57464599609375 69.17096710205078 50.01289749145508 C 67.35779571533203 54.29976654052734 64.76207733154297 58.14975738525391 61.45592498779297 61.45592498779297 C 58.14975738525391 64.76207733154297 54.29976654052734 67.35779571533203 50.01289749145508 69.17096710205078 C 45.57464599609375 71.04817199707031 40.86003112792969 72 36 72 Z M 36 9.257116317749023 C 21.25392532348633 9.257116317749023 9.257116317749023 21.25392532348633 9.257116317749023 36 C 9.257116317749023 50.74607086181641 21.25392532348633 62.74288558959961 36 62.74288558959961 C 50.74607086181641 62.74288558959961 62.74288558959961 50.74607086181641 62.74288558959961 36 C 62.74288558959961 21.25392532348633 50.74607086181641 9.257116317749023 36 9.257116317749023 Z" fill="#000000" fill-opacity="0.1" stroke="none" stroke-width="1" stroke-opacity="0.1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_3mqiaq =
    '<svg viewBox="35.8 4.4 31.7 31.7" ><path transform="translate(-336.36, -181.36)" d="M 372.1489562988281 185.7660522460938 C 389.6779174804688 185.7660522460938 403.8886108398438 199.9757690429688 403.8886108398438 217.5055541992188" fill="none" stroke="#29347b" stroke-width="4" stroke-miterlimit="10" stroke-linecap="round" /></svg>';
const String _svg_r4yt40 =
    '<svg viewBox="292.0 165.9 23.6 25.8" ><path transform="translate(286.36, 161.42)" d="M 27.17506980895996 23.95788955688477 C 26.98062705993652 23.96459007263184 26.78618049621582 23.9713020324707 26.59173202514648 23.9713020324707 C 23.3799991607666 23.9713020324707 20.35602378845215 22.70404243469238 18.08971405029297 20.39079666137695 C 15.81669998168945 18.08424949645996 14.56955718994141 15.02003765106201 14.56955718994141 11.75467109680176 C 14.56955718994141 9.897369384765625 14.97856521606445 8.10041332244873 15.74294662475586 6.477790355682373 C 15.9507999420166 6.03525447845459 16.36651229858398 5.364748954772949 16.65482902526855 4.908804416656494 C 16.78223037719727 4.714355945587158 16.62130546569824 4.459563732147217 16.39332962036133 4.499794483184814 C 15.99102783203125 4.560140132904053 15.3741626739502 4.694242000579834 14.53603172302246 4.955738067626953 C 9.319490432739258 6.611888885498047 5.625001430511475 11.51999473571777 5.625001430511475 17.30646324157715 C 5.625001430511475 24.45406150817871 11.33100986480713 30.24723243713379 18.37133026123047 30.24723243713379 C 22.26026153564453 30.24723243713379 25.74689102172852 28.47709465026855 28.08696556091309 25.68108940124512 C 28.48926162719727 25.19832420349121 28.8580493927002 24.75578880310059 29.18659591674805 24.21938514709473 C 29.30728530883789 24.01823234558105 29.1396598815918 23.77014923095703 28.91168975830078 23.81037902832031 C 28.34175491333008 23.92436408996582 27.76511383056641 23.93106460571289 27.17506980895996 23.95788955688477 Z" fill="#000000" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_65wo0g =
    '<svg viewBox="0.0 0.0 33.5 35.7" ><path transform="translate(-16.0, 0.0)" d="M 41.1282844543457 0 L 41.1282844543457 33.64397430419922 L 36.94023513793945 33.64397430419922 L 36.94023513793945 8.51569652557373 L 28.56414222717285 8.51569652557373 L 28.56414222717285 33.64397430419922 L 24.37609481811523 33.64397430419922 L 24.37609481811523 16.89179229736328 L 16 16.89179229736328 L 16 33.64397430419922 L 16 35.73800277709961 L 24.37609481811523 35.73800277709961 L 28.56414222717285 35.73800277709961 L 36.94023513793945 35.73800277709961 L 41.1282844543457 35.73800277709961 L 49.5043830871582 35.73800277709961 L 49.5043830871582 33.64397430419922 L 49.5043830871582 0 L 41.1282844543457 0 Z" fill="#000000" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ji38qh =
    '<svg viewBox="19.6 8.5 5.6 26.0" ><path transform="translate(-647.48, -1886.43)" d="M 667.0625610351563 1894.950073242188 L 672.6981811523438 1894.950073242188 L 672.6981811523438 1920.928344726563 L 667.0625610351563 1920.928344726563 L 667.0625610351563 1894.950073242188 Z" fill="#000000" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6xxtlx =
    '<svg viewBox="0.0 0.0 26.8 30.8" ><path transform="translate(-1.03, 0.0)" d="M 12.61579895019531 21.8453311920166 C 12.78360176086426 24.75392913818359 12.17796611785889 25.90540885925293 10.15468215942383 26.22944259643555 C 8.129467010498047 26.5534782409668 6.169826984405518 24.80986404418945 5.772500038146973 22.33138275146484 C 5.591192722320557 21.19340515136719 5.40988826751709 18.88080024719238 5.178433895111084 17.86819648742676 L 3.440607070922852 12.97681331634521 C 3.340309143066406 12.54476737976074 2.194615364074707 10.48483562469482 2.013310432434082 9.58795166015625 C 1.644913673400879 7.76332950592041 2.821468353271484 5.988852977752686 4.642233371734619 5.618529319763184 C 4.642233371734619 5.618529319763184 7.350239276885986 5.072685718536377 7.826647758483887 4.976245880126953 C 8.303055763244629 4.877878189086914 9.724564552307129 4.785296440124512 9.724564552307129 4.785296440124512 C 11.67648506164551 4.785296440124512 12.61772727966309 5.794046878814697 12.61772727966309 7.745968818664551 C 12.61772727966309 8.878164291381836 10.6117992401123 10.61985015869141 10.6117992401123 10.61985015869141 C 10.6117992401123 10.61985015869141 7.772641658782959 13.35292720794678 8.765962600708008 15.38392925262451 C 9.755426406860352 17.4149284362793 12.01595115661621 18.00128364562988 12.61579895019531 21.8453311920166 Z M 10.34948539733887 4.285743236541748 C 11.15571594238281 4.285743236541748 11.81149768829346 3.323282957077026 11.81149768829346 2.140942573547363 C 11.81149768829346 0.9586021900177002 11.15571594238281 -1.521209469501628e-08 10.34948539733887 -1.521209469501628e-08 C 9.537473678588867 -1.521209469501628e-08 8.881688117980957 0.9605309367179871 8.881688117980957 2.140942573547363 C 8.883617401123047 3.32328462600708 9.537473678588867 4.285743236541748 10.34948539733887 4.285743236541748 Z M 7.234513759613037 4.06779146194458 C 7.753354072570801 3.994497537612915 8.087033271789551 3.3194260597229 7.977091789245605 2.559487819671631 C 7.86907958984375 1.799549221992493 7.359882831573486 1.244061231613159 6.841042518615723 1.319283843040466 C 6.324129104614258 1.392577171325684 5.990452289581299 2.067649602890015 6.098463535308838 2.827587366104126 C 6.206472396850586 3.585597515106201 6.715670585632324 4.141084671020508 7.234513759613037 4.06779146194458 Z M 5.014487743377686 4.669569969177246 C 5.390598773956299 4.580846309661865 5.5892653465271 4.063934803009033 5.460036754608154 3.516160726547241 C 5.328878879547119 2.968388319015503 4.919978141784668 2.594205617904663 4.545795917510986 2.682929039001465 C 4.17161226272583 2.771652936935425 3.971019268035889 3.286636114120483 4.102175712585449 3.836337566375732 C 4.231405258178711 4.384111404418945 4.638375759124756 4.758293628692627 5.014487743377686 4.669569969177246 Z M 3.218795776367188 5.846123695373535 C 3.546689033508301 5.716896057128906 3.658556938171387 5.221198558807373 3.467608451843262 4.740934371948242 C 3.27665901184082 4.260669708251953 2.858115196228027 3.975210905075073 2.53022289276123 4.106367111206055 C 2.202330589294434 4.237523555755615 2.090461730957031 4.731292247772217 2.281410694122314 5.211557388305664 C 2.472359657287598 5.691822528839111 2.890904426574707 5.975352764129639 3.218795776367188 5.846123695373535 Z M 1.263016104698181 5.984997272491455 C 1.045064091682434 6.069862842559814 0.969841480255127 6.39775562286377 1.095212578773499 6.717930793762207 C 1.220583200454712 7.036181449890137 1.500255465507507 7.225200176239014 1.718207240104675 7.140334606170654 C 1.936159253120422 7.055469036102295 2.011382102966309 6.725647449493408 1.886011481285095 6.407398700714111 C 1.75871205329895 6.087221145629883 1.480968236923218 5.898202896118164 1.263016104698181 5.984997272491455 Z M 24.28876495361328 10.62370586395264 C 24.28876495361328 10.62370586395264 21.64054489135742 9.846408843994141 21.17378997802734 9.711394309997559 C 20.70702362060547 9.57252311706543 19.29900932312012 9.358428001403809 19.29900932312012 9.358428001403809 C 17.35287857055664 9.192553520202637 16.33062744140625 10.11836433410645 16.16474914550781 12.06257438659668 C 16.06445503234863 13.18704795837402 17.91415405273438 15.09461402893066 17.91415405273438 15.09461402893066 C 17.91415405273438 15.09461402893066 20.51028633117676 18.06107330322266 19.34530448913574 19.99756050109863 C 18.18418312072754 21.93405723571777 15.88315105438232 22.32945823669434 14.95926284790039 26.10407638549805 C 14.54265117645264 28.98373603820801 15.04991817474365 30.18536949157715 17.03269958496094 30.68492317199707 C 19.02512359619141 31.18254470825195 21.1236400604248 29.60866546630859 21.73506164550781 27.17840766906738 C 22.01473617553711 26.05586051940918 22.39084243774414 23.7683277130127 22.71102333068848 22.77885818481445 L 24.85968399047852 18.0552864074707 C 24.99662208557129 17.63095474243164 26.31397819519043 15.67903614044189 26.57243156433105 14.80143356323242 C 27.09320068359375 13.01732063293457 26.07094955444336 11.14640522003174 24.28876495361328 10.62370586395264 Z M 18.71652030944824 8.802942276000977 C 19.52275085449219 8.87237548828125 20.25761222839355 7.973567962646484 20.35984039306641 6.793153762817383 C 20.46206855773926 5.612740993499756 19.89114761352539 4.602063179016113 19.08298873901367 4.532627582550049 C 18.27676200866699 4.463191032409668 17.54189872741699 5.362001419067383 17.43967247009277 6.54241418838501 C 17.33745002746582 7.722824573516846 17.9102954864502 8.735432624816895 18.71652030944824 8.802942276000977 Z M 21.8392162322998 8.85308837890625 C 22.34841346740723 8.970744132995605 22.9019718170166 8.45961856842041 23.07555961608887 7.715111255645752 C 23.24529266357422 6.968673706054688 22.97333335876465 6.268527984619141 22.46413803100586 6.150872230529785 C 21.95494651794434 6.033215999603271 21.40138053894043 6.544342041015625 21.2297191619873 7.288849830627441 C 21.05612945556641 8.035286903381348 21.33194923400879 8.735432624816895 21.8392162322998 8.85308837890625 Z M 23.99944496154785 9.641956329345703 C 24.36398506164551 9.761543273925781 24.80182075500488 9.425934791564941 24.97926139831543 8.89166259765625 C 25.15671920776367 8.357393264770508 25.00241279602051 7.825048446655273 24.63787078857422 7.705466270446777 C 24.2733268737793 7.585880756378174 23.83356857299805 7.921488761901855 23.65612602233887 8.45576000213623 C 23.47867965698242 8.990033149719238 23.63297653198242 9.522372245788574 23.99944496154785 9.641956329345703 Z M 26.52228546142578 9.298637390136719 C 26.20403289794922 9.140477180480957 25.76042175292969 9.385431289672852 25.53089332580566 9.84833812713623 C 25.30136680603027 10.31124496459961 25.37080764770508 10.81272792816162 25.68905448913574 10.97088527679443 C 26.00537109375 11.12904739379883 26.45091438293457 10.88409042358398 26.68044090270996 10.42118358612061 C 26.90997123718262 9.958277702331543 26.8386058807373 9.454867362976074 26.52228546142578 9.298637390136719 Z M 27.62554550170898 11.27370548248291 C 27.41531181335449 11.16954898834229 27.12020874023438 11.33349418640137 26.96590614318848 11.64017391204834 C 26.81546211242676 11.9468469619751 26.85982131958008 12.2824535369873 27.07199096679688 12.38660526275635 C 27.2822265625 12.49269199371338 27.57733154296875 12.32874488830566 27.73163032531738 12.02014064788818 C 27.88400650024414 11.71346664428711 27.83771705627441 11.37978744506836 27.62554550170898 11.27370548248291 Z" fill="#000000" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e7qmdg =
    '<svg viewBox="-0.2 -0.2 89.0 89.0" ><path transform="translate(-0.23, -0.23)" d="M 44.49999618530273 88.99999237060547 C 38.49246597290039 88.99999237060547 32.6646728515625 87.82342529296875 27.17850494384766 85.50299835205078 C 21.87945556640625 83.26171112060547 17.12044143676758 80.05312347412109 13.03365898132324 75.96635437011719 C 8.946878433227539 71.87956237792969 5.738284587860107 67.12055206298828 3.49700403213501 61.82150268554688 C 1.17656409740448 56.33532333374023 0 50.50753784179688 0 44.49999618530273 C 0 38.49246597290039 1.17656409740448 32.6646728515625 3.49700403213501 27.17850494384766 C 5.738284587860107 21.87945556640625 8.946878433227539 17.12044143676758 13.03365898132324 13.03365898132324 C 17.12044143676758 8.946878433227539 21.87945556640625 5.738284587860107 27.17850494384766 3.49700403213501 C 32.6646728515625 1.17656409740448 38.49246597290039 0 44.49999618530273 0 C 50.50753784179688 0 56.33532333374023 1.17656409740448 61.82150268554688 3.49700403213501 C 67.12055206298828 5.738284587860107 71.87956237792969 8.946878433227539 75.96635437011719 13.03365898132324 C 80.05312347412109 17.12044143676758 83.26171112060547 21.87945556640625 85.50299835205078 27.17850494384766 C 87.82342529296875 32.6646728515625 88.99999237060547 38.49246597290039 88.99999237060547 44.49999618530273 C 88.99999237060547 50.50753784179688 87.82342529296875 56.33532333374023 85.50299835205078 61.82150268554688 C 83.26171112060547 67.12055206298828 80.05312347412109 71.87956237792969 75.96635437011719 75.96635437011719 C 71.87956237792969 80.05312347412109 67.12055206298828 83.26171112060547 61.82150268554688 85.50299835205078 C 56.33532333374023 87.82342529296875 50.50753784179688 88.99999237060547 44.49999618530273 88.99999237060547 Z M 44.49999618530273 11.4428243637085 C 26.272216796875 11.4428243637085 11.4428243637085 26.272216796875 11.4428243637085 44.49999618530273 C 11.4428243637085 62.72778701782227 26.272216796875 77.55718994140625 44.49999618530273 77.55718994140625 C 62.72778701782227 77.55718994140625 77.55718994140625 62.72778701782227 77.55718994140625 44.49999618530273 C 77.55718994140625 26.272216796875 62.72778701782227 11.4428243637085 44.49999618530273 11.4428243637085 Z" fill="#000000" fill-opacity="0.1" stroke="none" stroke-width="1" stroke-opacity="0.1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-270.73, -185.02)" d="M 318.1360778808594 190.8389892578125 C 338.3753356933594 190.8389892578125 354.7828369140625 208.0321197509766 354.7828369140625 229.2419281005859 C 354.7828369140625 241.1720428466797 349.5918273925781 251.8308868408203 341.4464111328125 258.875 C 338.7319030761719 261.2227172851563 335.68896484375 263.16845703125 332.400634765625 264.6259765625" fill="none" stroke="#29347b" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_fz6w0 =
    '<svg viewBox="351.8 77.5 21.6 21.6" ><path transform="translate(347.27, 73.0)" d="M 4.5 16.50766754150391 L 14.10613441467285 16.50766754150391 L 14.10613441467285 4.5 L 4.5 4.5 L 4.5 16.50766754150391 Z M 4.5 26.11380386352539 L 14.10613441467285 26.11380386352539 L 14.10613441467285 18.90920066833496 L 4.5 18.90920066833496 L 4.5 26.11380386352539 Z M 16.50766754150391 26.11380386352539 L 26.11380386352539 26.11380386352539 L 26.11380386352539 14.10613441467285 L 16.50766754150391 14.10613441467285 L 16.50766754150391 26.11380386352539 Z M 16.50766754150391 4.5 L 16.50766754150391 11.70460033416748 L 26.11380386352539 11.70460033416748 L 26.11380386352539 4.5 L 16.50766754150391 4.5 Z" fill="#29347b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
