import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:snap_n_eat/models/FitbitOAuth.dart';
import 'package:snap_n_eat/models/user.dart';
import 'package:snap_n_eat/screens/home.dart';
import 'package:snap_n_eat/utils/apiendpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OAuth {
  MyOAuth2Client client = MyOAuth2Client(
      redirectUri: 'my.app://oauth2redirect', customUriScheme: 'my.app');
  AccessTokenResponse tokenResp;
  String token;
  var httpClient;
  Map userProfile;
  APIEndpoints apiEndpoints = new APIEndpoints();
  List<String> scopes = [
    "activity",
    "heartrate",
    "location",
    "profile",
    "nutrition",
    "weight",
    "sleep",
  ];
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final firestoreInstance = Firestore.instance;

  Future<AccessTokenResponse> authorise(
      BuildContext context, bool hasAccount) async {
    tokenResp = await client.getTokenWithAuthCodeFlow(
        clientId: '22BTRZ',
        clientSecret: '75e8096e59982cb6e3d084c44c46102f',
        scopes: scopes);
    token = tokenResp.accessToken;
    getUserProfile().then((value) {
      User user = new User(
          uid: value["encodedId"],
          fullName: value["fullName"],
          avatar: value["avatar150"],
          height: value["height"],
          age: value["age"],
          gender: value["gender"],
          weight: value["weight"]);
      firestoreInstance
          .collection("users")
          .document(user.uid)
          .setData(user.toMap(), merge: true)
          .then((_) {
        print("Successfull");
      });
    });
    SharedPreferences prefs = await _prefs;
    prefs.setString("token", token).then((value) {
      if (value) {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage(
                      token: token,
                    )));
      }
    });
    return tokenResp;
  }

  Future<AccessTokenResponse> getToken() async {
    OAuth2Helper oauth2Helper = OAuth2Helper(
      client,
      grantType: OAuth2Helper.AUTHORIZATION_CODE,
      clientId: '22BTRZ',
      clientSecret: '75e8096e59982cb6e3d084c44c46102f',
      scopes: scopes,
    );
    return oauth2Helper.getToken();
  }

  Future<bool> validate(String token) async {
    var client = http.Client();
    var uriResponse = await client.post(apiEndpoints.checkToken, headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/x-www-form-urlencoded"
    }, body: {
      "token": token
    });
    client.close();
    Map decode = json.decode(uriResponse.body);
    print(decode);
    return decode['active'];
  }

  Future<Map> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    var client = http.Client();
    try {
      var uriResponse = await client.get(
          'https://api.fitbit.com/1/user/-/profile.json',
          headers: {"Authorization": "Bearer $token"});
      userProfile = json.decode(uriResponse.body);
      print(uriResponse.statusCode);
      return userProfile["user"];
    } finally {
      client.close();
    }
  }

  floor() async {
    var client = http.Client();
    try {
      var uriResponse = await client.get(apiEndpoints.heartRate,
          headers: {"Authorization": "Bearer $token"});
      userProfile = json.decode(uriResponse.body);
      print(uriResponse.body);
    } finally {
      client.close();
    }
  }

  fetchAllData(String token, BuildContext context) async {
    // getToken().then((value) => print(value));
    var client = http.Client();
    List<String> apiRequests = [
      "https://api.fitbit.com/1/user/-/activities/calories/date/today/1d/1min.json",
      "https://api.fitbit.com/1/user/-/activities/floors/date/today/1d/1min.json",
      "https://api.fitbit.com/1/user/-/activities/distance/date/today/1d/1min.json",
      "https://api.fitbit.com/1/user/-/activities/heart/date/2020-01-15/1d/1min/time/00:00/00:01.json",
      "https://api.fitbit.com/1.2/user/-/sleep/date/2020-01-15.json",
      'https://api.fitbit.com/1/user/-/profile.json'
    ];

    List<Response> list = await Future.wait(apiRequests.map((apiReq) =>
        client.get(apiReq, headers: {"Authorization": "Bearer $token"})));

    list.map((response) {
      Map result = json.decode(response.body);
      // if (result.containsKey("user")) {
      //   Map userDetails = result["user"];
      // }
      // print(result);
    }).toList();
  }

  perMonthBurnt() {}

  perMonthSteps() {}
  perDaySteps() {}
  perDayIntake() {}
  heartRate() {}
  perDayActivity() {}
  foods() {}
}
