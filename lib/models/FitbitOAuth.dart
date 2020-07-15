import 'package:oauth2_client/oauth2_client.dart';
import 'package:meta/meta.dart';

class MyOAuth2Client extends OAuth2Client {
  MyOAuth2Client({@required String redirectUri, @required String customUriScheme}): super(
    authorizeUrl: 'https://www.fitbit.com/oauth2/authorize', //Your service's authorization url
    tokenUrl: 'https://api.fitbit.com/oauth2/token', //Your service access token url
    redirectUri: redirectUri,
    customUriScheme: customUriScheme,
  );
}