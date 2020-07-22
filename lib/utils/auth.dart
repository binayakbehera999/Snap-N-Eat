import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:snap_n_eat/main.dart';
import 'package:snap_n_eat/models/FitbitOAuth.dart';
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
  ];
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<AccessTokenResponse> authorise(BuildContext context) async {
    tokenResp = await client.getTokenWithAuthCodeFlow(
        clientId: '22BTRZ',
        clientSecret: '75e8096e59982cb6e3d084c44c46102f',
        scopes: scopes);
    token = tokenResp.accessToken;
    SharedPreferences prefs = await _prefs;
    prefs.setString("token", token).then((value){
      if(value){
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => MyHomePage())); 
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

    return decode['active'];
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

  perMonthBurnt() {}

  perMonthSteps() {}
  perDaySteps() {}
  perDayIntake() {}
  heartRate() {}
  perDayActivity() {}
  foods() {}
}
