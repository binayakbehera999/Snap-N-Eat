import 'package:oauth2_client/access_token_response.dart';
import 'package:snap_n_eat/models/FitbitOAuth.dart';

class OAuth {
  MyOAuth2Client client;
  AccessTokenResponse tokenResp;
  String token;

  authorise() async {
    List<String> scopes = ['heartrate', 'weight'];
    client = MyOAuth2Client(
        redirectUri: 'my.app://oauth2redirect', customUriScheme: 'my.app');
    tokenResp = await client.getTokenWithAuthCodeFlow(
        clientId: '22BTRZ',
        clientSecret: '75e8096e59982cb6e3d084c44c46102f',
        scopes: scopes);
    token = tokenResp.accessToken;
  }

}
