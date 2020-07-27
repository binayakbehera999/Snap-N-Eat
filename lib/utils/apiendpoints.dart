import 'package:intl/intl.dart';

class APIEndpoints {
  final DateTime now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  String perDayBurnt;
  String floor;
  String distance;
  String steps;
  String perDayIntake;
  String heartRate;
  String perDayActivity;
  String foods;
  String sleep;
  String today;
  String checkToken;
  APIEndpoints(
      {this.perDayBurnt =
          "https://api.fitbit.com/1/user/-/activities/calories/date/today/1d/15min/time/00:00/12:45.json",
      this.floor =
          "https://api.fitbit.com/1/user/-/activities/floors/date/today/1d/15min/time/00:00/12:45.json",
      this.distance =
          "https://api.fitbit.com/1/user/-/activities/distance/date/today/1d/15min/time/00:00/12:45.json",
      this.steps =
          "https://api.fitbit.com/1/user/-/activities/steps/date/today/1d/15min/time/00:00/12:45.json",
      // this.perDayIntake =
      // "https://api.fitbit.com/1/user/-/activities/steps/date/2020-01-15/1d/15min/time/12:30/12:45.json",
      this.heartRate =
          "https://api.fitbit.com/1/user/-/activities/heart/date/today/1d/1sec/time/00:00/01:00.json",
      this.perDayActivity,
      this.sleep = "https://api.fitbit.com/1.2/user/-/sleep/date/today.json",
      this.checkToken = "https://api.fitbit.com/1.1/oauth2/introspect",
      this.foods});
}
