import 'package:flutter/widgets.dart';

class DashBoardProvider with ChangeNotifier {
  String calorie = "Loading...";
  String distance = "Loading...";
  String floor = "Loading...";
  String heartrate = "Loading...";
  String steps = "Loading...";
  String sleep = "Loading...";
  String firstName = "Loading...";
  String lastName = "Loading...";
  String email = "Loading...";
  String gender = "";
  double height;
  double weight;
  String avatar;

  void setCalories(String calories) {
    this.calorie = calories;
    notifyListeners();
  }

  void sesetUserDetails(String firstName, String lastName, String gender, String avatar,
    double height, double weight) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.gender = gender;
    this.height = height;
    this.weight = weight;
    notifyListeners();
  }

  void setDistance(String distance) {
    this.distance = distance;
    notifyListeners();
  }

  void setFloor(String floor) {
    this.floor = floor;
    notifyListeners();
  }

  void setHeartRate(String heartrate) {
    this.heartrate = heartrate;
    notifyListeners();
  }

  void setSteps(String steps) {
    this.steps = steps;
    notifyListeners();
  }

  void setSleep(String sleep) {
    this.sleep = sleep;
    notifyListeners();
  }
}
