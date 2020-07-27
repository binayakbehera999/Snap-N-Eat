import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/models/user.dart';

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
  String userId = "Loading...";
  String gender = "";
  double height;
  double weight;
  String avatar;
  User user;
  void setCalories(String calories) {
    this.calorie = calories;
    notifyListeners();
  }

  void sesetUserDetails(String firstName, String lastName, String gender,
      String userId, String avatar, double height, double weight) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.gender = gender;
    this.height = height;
    this.weight = weight;
    this.userId = userId;
    this.avatar = avatar;
    user = new User(
        uid: userId,
        fullName: firstName + lastName,
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
