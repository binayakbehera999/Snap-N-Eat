import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/auth.dart';
import 'package:snap_n_eat/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    @required this.hasAccount,
    Key key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final bool hasAccount;
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var oauth;

  @override
  void initState() {
    super.initState();
    oauth = new OAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          widthFactor: 5.0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: new Image.asset(
                  'assets/icons/login-logo.png',
                  height: 80,
                )),
                SizedBox(
                  height: 50,
                ),
                RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  padding: EdgeInsets.all(16.0),
                  onPressed: () {
                    oauth.authorise(context, widget.hasAccount).then((value) {
                      print(value);
                    });
                  },
                  color: primaryColor,
                  icon: Icon(
                    Icons.lock_open,
                    size: 30,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: 'Typo Grotesk',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
