import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/models/user.dart';

class DashBoardProvider with ChangeNotifier {
  String calorie = "Loading...";
  String distance = "Loading...";
  String floor = "Loading...";
  String heartrate = "Loading...";
  String steps = "Loading...";
  String sleep = "Loading...";
  String fullName = "Loading...";
  String email = "Loading...";
  String userId = "Loading...";
  String gender = "";
  double rating = 0.0;
  double bmi = 0.0;
  double height;
  double weight;
  String avatar;
  User user;
  void setCalories(String calories) {
    this.calorie = calories;
    notifyListeners();
  }

  void setUserDetails(String fullName, String gender, String userId,
      String avatar, double height, double weight, double rating, double bmi) {
    this.fullName = fullName;
    this.gender = gender;
    this.height = height;
    this.weight = weight;
    this.userId = userId;
    this.avatar = avatar;
    this.rating = rating;
    this.bmi = bmi;
    user = new User(
        uid: userId,
        fullName: fullName,
        avatar: avatar,
        height: height,
        age: 0,
        gender: gender,
        weight: weight);
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
