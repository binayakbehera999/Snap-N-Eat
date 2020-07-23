class RatingCalculator {
  double bmiCalculator(double height, double weight) {
    double bmi;
    bmi = weight * 10000 / (height * height);
    return bmi;
  }

  double bmrCalculator(double height, double weight, int age,
      double activityFactor, String sex) {
    double bmr;
    if (sex == 'MALE') {
      bmr = ((10 * weight) + (6.25 * height) - (5 * age) - 5) * activityFactor;
    } else {
      bmr =
          ((10 * weight) + (6.25 * height) - (5 * age) - 161) * activityFactor;
    }
    return bmr;
  }

  int choice(
      double avgCalBurnt,
      double calorieIntake,
      double foodValue,
      int age,
      int suggestion,
      double height,
      double weight,
      String sex,
      double activityFactor) {
    double bmr = bmrCalculator(height, weight, age, activityFactor, sex);
    double bmiValue = bmiCalculator(height, weight);
    double newBmr;
    // console.log(bmr + "bmr" + bmiValue + "bmi");
    if (suggestion == 1) {
      if ((bmiValue) < 18.25) {
        var suggestedWeight;
        suggestedWeight = 18.25 * (height * height) / 10000;
        // console.log(suggestedWeight);
        if (sex == 'MALE') {
          newBmr = [(10 * suggestedWeight) + (6.25 * height) - (5 * age) - 5] *
              activityFactor;
        } else {
          newBmr =
              ((10 * suggestedWeight) + (6.25 * height) - (5 * age) - 161) *
                  activityFactor;
        }
      } else if (bmiValue > 25) {
        var suggestedWeight;
        suggestedWeight = 25 * (height * height) / 10000;
        // console.log(suggestedWeight);
        if (sex == 'MALE') {
          newBmr = (10 * suggestedWeight) +
              (6.25 * height) -
              (5 * age) -
              5 * activityFactor;
        } else {
          newBmr =
              ((10 * suggestedWeight) + (6.25 * height) - (5 * age) - 161) *
                  activityFactor;
        }
      }
    } else {
      newBmr = bmr;
      // console.log(newBmr);
    }
    var overallCalorie = calorieIntake - avgCalBurnt + foodValue;
    if (bmiValue < 18.25) {
      if (suggestion == 0) {
        return 0;
      } else if (newBmr > overallCalorie) {
        // console.log("nbmr");
        // console.log(newBmr);
        // console.log(overallCalorie);
        return 1;
      } else {
        return 0;
      }
    }
    if (bmiValue > 25) {
      // console.log("nbmr");
      // console.log(newBmr);
      // console.log(overallCalorie);
      if (suggestion == 0) {
        return 1;
      } else if (newBmr > overallCalorie) {
        return 0;
      } else {
        return 1;
      }
    }
    return -1;
  }
}
