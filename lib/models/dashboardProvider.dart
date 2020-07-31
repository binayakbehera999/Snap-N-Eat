import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/models/user.dart';

class DashBoardProvider with ChangeNotifier {
  String calorie = "Loading";
  String distance = "Loading";
  String floor = "Loading";
  String heartrate = "Loading";
  String steps = "Loading";
  String sleep = "Loading";
  String fullName = "Loading";
  String email = "Loading";
  String userId = "Loading";
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

  List<String> logo = [
    'assets/icons/logo.png',
    'assets/icons/deadline.png',
    'assets/icons/edit.png',
    'assets/icons/message.png',
    'assets/icons/payslip.png',
    'assets/icons/refund.png',
  ];

  List<String> insuranceName = [
    'Life Insurance',
    'Motor insurance',
    'Health insurance',
    'Travel insurance',
    'Property insurance',
    'Mobile insurance',
  ];

  List<String> description = [
    'Life Insurance refers to a policy or cover whereby the policyholder can ensure financial freedom for his/her family members after death. Suppose you are the sole earning member in your family, supporting your spouse and children.'
        'In such an event, your death would financially devastate the whole family. Life insurance policies ensure that such a thing does not happen by providing financial assistance to your family in the event of your passing.',
    'Motor insurance refers to policies that offer financial assistance in the event of accidents involving your car or bike. Motor insurance can be availed for three categories of motorised vehicles.',
    'Health insurance refers to a type of general insurance, which provides financial assistance to policyholders when they are admitted to hospitals for treatment. Additionally, some plans also cover the cost of treatment undertaken at home,'
        'prior to a hospitalisation or after discharge from the same.'
        'With the rising medical inflation in India, buying health insurance has become a necessity. However, before proceeding with your purchase, consider the various types of health insurance plans available in India.',
    'When talking about the different types of insurance policies, one must not forget to learn more about travel insurance plans. Such policies ensure the financial safety of a traveller during a trip.'
        'Therefore, when compared to other insurance policies, travel insurance is a short-term cover.',
    'Any building or immovable structure can be insured through property insurance plans. This can be either your residence or commercial space. If any damage befalls such a property, '
        'you can claim financial assistance from the insurance provider. Keep in mind that such a plan also financially safeguards the content inside the property.',
    'Owing to the rising price of mobile phones and their several applications today, it has become imperative to insure the device. '
        'Mobile insurance allows you to reclaim money that you spend on repairing your phone in the event of accidental damage.',
  ];

  List<String> getLogo() {
    return logo;
  }

  List<String> getInsurance() {
    return insuranceName;
  }

  List<String> getDesription() {
    return description;
  }
}
