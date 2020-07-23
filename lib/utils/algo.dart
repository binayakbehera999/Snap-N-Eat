class RatingCalculator {
  bool choice(double bmr, double newbmr, double calorieIntake,
      double calorieBurnt, double scannedFoodCalorie) {
    if ((calorieIntake + scannedFoodCalorie - calorieBurnt - bmr) <= newbmr) {
      return true;
    } else {
      return false;
    }
  }

  double newBmrCalc(double height, double optimumBmi, String sex, int age) {
    double optimumWeight;
    double BMR;
    optimumWeight = (optimumBmi * height * height) / 10000;
    if (sex == 'MALE') {
      BMR = ((10 * optimumWeight) + (6.25 * height) - (5 * age) + 5);
    } else {
      BMR = ((10 * optimumWeight) + (6.25 * height) - (5 * age) - 161);
    }
    return BMR;
  }

  double healthRating(weight, height) {
    double optimumWeight = 21.7 * height * height / 10000;
    double rating = (5 - (weight - optimumWeight) / 5).abs();
    return rating;
  }

  double goalRating(initialWeight, currWeight, totalWeek, currWeek, height) {
    double goalWeight = 21.7 * height * height / 10000;
    double idealWeightChange =
        (((goalWeight - initialWeight) / totalWeek) * currWeek).abs();
    double actualWeightChange = (initialWeight - currWeight).abs();
    return (actualWeightChange / idealWeightChange) * 5;
  }
}
