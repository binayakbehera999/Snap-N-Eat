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
    print(tokenResp.refreshToken);
    SharedPreferences prefs = await _prefs;
    prefs.setString("refreshToken", tokenResp.refreshToken);
    prefs.setString("token", token).then((value) {
      if (value) {
        getUserProfile().then((userProfile) {
          firestoreInstance
              .collection('users')
              .document(userProfile["encodedId"])
              .get()
              .then((value) {
            if (value == null) {
              User user = new User(
                  uid: userProfile["encodedId"],
                  fullName: userProfile["fullName"],
                  avatar: userProfile["avatar150"],
                  height: userProfile["height"],
                  age: userProfile["age"],
                  gender: userProfile["gender"],
                  weight: userProfile["weight"]);
              firestoreInstance
                  .collection("users")
                  .document(user.uid)
                  .setData(user.toMap(), merge: true)
                  .whenComplete(() {
                print("Successfull");
              });
            }
          });
        });
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
      clientId: '22BTYH',
      clientSecret: 'cb2538d70342d5c6f1880535a4a4c766',
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
    // print(uriResponse.body);
    Map decode = json.decode(uriResponse.body);
    // return false;
    return decode.containsKey('active');
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

  Future<String> refreshToken(String refreshToken) async {
    var client = http.Client();
    var secretKey = "22BTRZ:75e8096e59982cb6e3d084c44c46102f";
    var bytes = utf8.encode(secretKey);
    var base64Str = base64.encode(bytes);
    print(base64Str);
    var uriResponse =
        await client.post("https://api.fitbit.com/oauth2/token", headers: {
      "Authorization": "Basic $base64Str",
      "Content-Type": "application/x-www-form-urlencoded"
    }, body: {
      "grant_type": "refresh_token",
      "refresh_token": "$refreshToken",
    });
    Map result = json.decode(uriResponse.body);
    print(result['token']);
    String token = result['token'];
    String refreshtoken = result['refresh_token'];
    SharedPreferences prefs = await _prefs;
    prefs.setString("token", token).then((value) => print(value));
    prefs.setString("refreshToken", refreshtoken).then((value) => print(value));
    return token;
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

  Future<List<Response>> fetchAllData(String token) async {
    var client = http.Client();
    List<String> apiRequests = [
      "https://api.fitbit.com/1/user/-/activities/calories/date/2020-01-15/1d/15min/time/12:30/12:45.json",
      "https://api.fitbit.com/1/user/-/activities/floors/date/2020-01-15/1d/15min/time/12:30/12:45.json",
      "https://api.fitbit.com/1/user/-/activities/distance/date/2020-01-15/1d/15min/time/12:30/12:45.json",
      "https://api.fitbit.com/1/user/-/activities/heart/date/2020-01-15/1d/1sec/time/00:00/00:01.json",
      "https://api.fitbit.com/1/user/-/activities/steps/date/2020-01-15/1d/15min/time/12:30/12:45.json",
      "https://api.fitbit.com/1.2/user/-/sleep/date/2020-01-15.json",
      "https://api.fitbit.com/1/user/-/profile.json",
    ]; //different ids

    List<Response> list = await Future.wait(apiRequests.map((apiReq) =>
        client.get(apiReq, headers: {"Authorization": "Bearer $token"})));
    return list;
  }

  addUserstodB() async {}
  perMonthBurnt() {}

  perMonthSteps() {}
  perDaySteps() {}
  perDayIntake() {}
  heartRate() {}
  perDayActivity() {}
  foods() {}
}
