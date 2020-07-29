class RatingCalculator {
  bool choice(double bmr, double newbmr, double calorieIntake,
      double calorieBurnt, double scannedFoodCalorie) {
    if ((calorieIntake + scannedFoodCalorie - calorieBurnt - bmr) <= newbmr) {
      return true;
    } else {
      return false;
    }
  }

  double bmiCalculator(double height, double weight) {
    double bmi = (weight / (height * height)) * 10000;
    return bmi;
  }

  double optimumWeight(double bmi) {
    if (bmi < 18.5)
      return 18.5;
    else if (bmi > 24.9)
      return 24.9;
    else
      return bmi;
  }

  double newBmrCalc(double height, double optimumBmi, String sex, int age) {
    double optimumWeight;
    double bmr;
    optimumWeight = (optimumBmi * height * height) / 10000;
    if (sex == 'MALE') {
      bmr = ((10 * optimumWeight) + (6.25 * height) - (5 * age) + 5);
    } else {
      bmr = ((10 * optimumWeight) + (6.25 * height) - (5 * age) - 161);
    }
    return bmr;
  }

  double healthRating(weight, height) {
    double optimumWeight = 21.7 * height * height / 10000;
    double rating = (5 - (weight - optimumWeight) / 5).abs();
    return rating;
  }

  // double goalRating(initialWeight, currWeight, totalWeek, currWeek, height) {
  //   double goalWeight = 21.7 * height * height / 10000;
  //   double idealWeightChange =
  //       (((goalWeight - initialWeight) / totalWeek) * currWeek).abs();
  //   double actualWeightChange = (initialWeight - currWeight).abs();
  //   return (actualWeightChange / idealWeightChange) * 5;
  // }
}
