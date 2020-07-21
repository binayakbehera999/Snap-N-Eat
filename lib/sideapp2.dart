import 'package:flutter/material.dart';
import 'package:snap_n_eat/utils/auth.dart';

class SideApp extends StatefulWidget {
  SideApp({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SideAppState createState() => _SideAppState();
}
class _SideAppState extends State<SideApp> {

  var oauth;

  _MyHomePageState() {
    
  }

  @override
  void initState() {
    super.initState();
    oauth = new OAuth();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Text('Access Token', style: TextStyle(fontSize: 14)),
          ),
          Text('Hello', style: TextStyle(fontSize: 14))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          oauth.authorise().then((value) {
            print(value);
          });
        } ,
        label: Text('Authorize'),
        // icon: Icon(Icons.add),
        icon: Icon(Icons.lock_open),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}