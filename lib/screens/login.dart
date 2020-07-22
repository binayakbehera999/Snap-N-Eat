import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
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
      appBar: AppBar(
        title: Text("Gamify Insurance"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          widthFactor: 5.0,
          child: RaisedButton.icon(
            shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          padding: EdgeInsets.all(16.0),
            onPressed: () {
              oauth.authorise(context).then((value) {
                print(value);
              });
            },
            color: Color(0xff29347b),
            icon: Icon(Icons.lock_open,size: 30,color: Colors.white,),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
