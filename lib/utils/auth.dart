import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:provider/provider.dart';
import 'package:snap_n_eat/models/FitbitOAuth.dart';
import 'package:snap_n_eat/models/dashboardProvider.dart';
import 'package:snap_n_eat/screens/dashboard.dart';
import 'package:snap_n_eat/screens/home.dart';
import 'package:snap_n_eat/utils/apiendpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OAuth {
  MyOAuth2Client client = MyOAuth2Client(
      redirectUri: 'my.app://oauth2redirect', customUriScheme: 'my.app');
  AccessTokenResponse tokenResp;
  String token;
  var httpClient;
  var userProfile;
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

  Future<AccessTokenResponse> authorise(BuildContext context) async {
    tokenResp = await client.getTokenWithAuthCodeFlow(
        clientId: '22BTRZ',
        clientSecret: '75e8096e59982cb6e3d084c44c46102f',
        scopes: scopes);
    token = tokenResp.accessToken;
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

    return decode.containsKey('active');
  }

  getUserProfile() async {
    var client = http.Client();
    try {
      var uriResponse = await client.get(
          'https://api.fitbit.com/1/user/-/profile.json',
          headers: {"Authorization": "Bearer $token"});
      userProfile = json.decode(uriResponse.body);
      print(uriResponse.statusCode);
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

    // list.map((response) {
    //   Map result = json.decode(response.body);
    //   // print(result[0]);
    //   if (result.containsKey('activities-calories')) {
    //     dashBoardProvider
    //         .setCalories(result['activities-calories'][0]['value']);
    //     print(result['activities-calories'][0]['value']);
    //   } else if (result.containsKey('activities-floors')) {
    //     dashBoardProvider.setFloor(result['activities-floors'][0]['value']);
    //   } else if (result.containsKey('activities-heart')) {
    //     dashBoardProvider.setHeartRate(result['activities-heart'][0]['value']);
    //   } else if (result.containsKey('sleep')) {
    //     dashBoardProvider.setSteps(result['summary']['totalMinutesAsleep']);
    //   }
    //   // print(response.body);
    // }).toList();
    return list;
  }

  perMonthBurnt() {}

  perMonthSteps() {}
  perDaySteps() {}
  perDayIntake() {}
  heartRate() {}
  perDayActivity() {}
  foods() {}
}
