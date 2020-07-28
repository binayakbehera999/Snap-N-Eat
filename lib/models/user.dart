class User {
  String uid;
  String fullName;
  String avatar;
  double height;
  int age;
  String gender;
  double weight;
  double bmi;
  List<String> friends = [];
  List<String> pendingFriendRequests = [];
  List<double> healthRatingHistory = [];
  User({
    this.uid,
    this.fullName,
    this.avatar,
    this.height,
    this.age,
    this.gender,
    this.weight,
    this.bmi = 0.0,
  });
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'avatar': avatar,
      'height': height,
      'age': age,
      'gender': gender,
      'weight': weight
    };
  }
}
