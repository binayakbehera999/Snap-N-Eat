import 'package:snap_n_eat/utils/cameraOutput.dart';

foodCalorie(food) {
  switch (food) {
    case "0 Chocolate Cake":
      {
        return FoodDetails(
            foodName: "Chocolate Cake",
            calories: 424,
            fat: "22 gms",
            cholesterol: "24 mgs",
            protein: "3.8 gms",
            carbs: "58 gms",
            sugar: "44 gms");
      }

    case "1 Ice Cream":
      {
        return FoodDetails(
            foodName: "Ice Cream",
            calories: 210.0,
            fat: "13 gms",
            cholesterol: "70 mgs",
            protein: "3 gms",
            carbs: "20 gms",
            sugar: "19 gms");
      }

    case "2 Sushi":
      {
        return FoodDetails(
            foodName: "Sushi",
            calories: 240.0,
            fat: "17 gms",
            cholesterol: "65 mgs",
            protein: "4 gms",
            carbs: "19 gms",
            sugar: "1 gms");
      }

    case "3 Club_Sandwich":
      {
        return FoodDetails(
            foodName: "Club Sandwich",
            calories: 284.0,
            fat: "5.1 gms",
            cholesterol: "0 mgs",
            protein: "12.3 gms",
            carbs: "47.3 gms",
            sugar: "5 gms");
      }

    case "4 Fried Rice":
      {
        return FoodDetails(
            foodName: "Fried Rice",
            calories: 208.0,
            fat: "15.8 gms",
            cholesterol: "0 mgs",
            protein: "2.5 gms",
            carbs: "14.7 gms",
            sugar: "1.3 gms");
      }

    default:
      {
        return FoodDetails(
            foodName: "Could not Recognise",
            calories: 0.0,
            fat: "0 gms",
            cholesterol: "0 mgs",
            protein: "0 gms",
            carbs: "0 gms",
            sugar: "0 gms");
        ;
      }
      break;
  }
}
