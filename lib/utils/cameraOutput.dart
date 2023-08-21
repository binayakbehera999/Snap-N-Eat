class Food {
  String calories;
  String foodName;

  Food({this.calories, this.foodName});
}

class FoodDetails {
  String foodName, fat, cholesterol, protein, carbs, sugar;
  double calories;
  FoodDetails(
      {this.calories,
      this.foodName,
      this.fat,
      this.sugar,
      this.carbs,
      this.cholesterol,
      this.protein});
}
