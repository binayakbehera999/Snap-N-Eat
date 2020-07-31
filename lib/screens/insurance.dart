import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/screens/detailsPage.dart';
import 'package:snap_n_eat/utils/constants.dart';

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
    final List _description = _insurance.getDesription();
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: screenHeight*0.1,),
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
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _count,
                  itemBuilder: (context, index) {
                    return _buildCard(
                        _name[index], _logo[index], _description[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String logo, String description) {
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
                    heroTag: logo, name: name, description: description)));
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
                      style: TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.bold)
                    ),
                  ]
                ),
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
