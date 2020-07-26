import 'package:flutter/widgets.dart';

class DashBoardProvider with ChangeNotifier {
  String calorie;
  String distance;
  String floor;
  String heartrate;
  String steps;
  String sleep;
  String firstName;

  void setCalories(String calories) {
    this.calorie = calories;
    notifyListeners();
  }
  void setFirstName(String firstName) {
    this.firstName = firstName;
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
