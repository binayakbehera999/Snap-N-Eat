import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/screens/detailsPage.dart';
import 'package:snap_n_eat/utils/constants.dart';
import 'package:snap_n_eat/utils/gamePoints.dart';

import 'gameScreens/screen1.dart';

class Insurance extends StatefulWidget {
  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    final _insurance = Provider.of<DashBoardProvider>(context);
    final _count = _insurance.getInsurance().length;
    final List _name = _insurance.getInsurance();
    final List _logo = _insurance.getLogo();
    final Map _description = _insurance.getDesription();
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    print(_description[_name[0]]['eligibility']);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: <Widget>[

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Text(
                "Insurance",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: screenHeight * 0.065,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _count,
                        itemBuilder: (context, index) {
                          return _buildCard(_name[index], _logo[index], _description[_name[index]]);
                        }
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: primaryColor,
                child: Icon(Icons.chat),
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: screenHeight * 0.05,
            child: IconButton(
              onPressed: () {
                var pt = Point(
                             point: 0
                           );
                Navigator.push(context,
                           MaterialPageRoute(builder: (context) => ScreenOne(point:pt)),
                         );
              },
              icon: Icon(Icons.gamepad),
              color: Colors.amber,
              iconSize: 30,),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String logo, Map description) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: InkWell(
          splashColor: secondaryColor,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                heroTag: logo, name: name, description: description)
              )
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(children: [
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: logo,
                      child: Image(
                        image: AssetImage(logo),
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(name,
                  softWrap: true,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold)),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Colors.black,
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
