import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:snap_n_eat/models/FitbitOAuth.dart';
import 'package:snap_n_eat/utils/apiendpoints.dart';

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

  Future<AccessTokenResponse> authorise() async {
    client = MyOAuth2Client(
        redirectUri: 'my.app://oauth2redirect', customUriScheme: 'my.app');
    tokenResp = await client.getTokenWithAuthCodeFlow(
        clientId: '22BTRZ',
        clientSecret: '75e8096e59982cb6e3d084c44c46102f',
        scopes: scopes);
    token = tokenResp.accessToken;
    floor();
    return tokenResp;
  }

  validate() async {
    OAuth2Helper oauth2Helper = OAuth2Helper(
      client,
      grantType: OAuth2Helper.AUTHORIZATION_CODE,
      clientId: '22BTRZ',
      clientSecret: '75e8096e59982cb6e3d084c44c46102f',
      scopes: scopes,
    );
    http.Response resp = await oauth2Helper.post(
        'https://api.fitbit.com/oauth2/token',
        headers: {"Authorization": "Bearer $token"});
    print(resp.body);
  }

  getUserProfile() async {
    var client = http.Client();
    try {
      print(token);
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
       //print(token);
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
