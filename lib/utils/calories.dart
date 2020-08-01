foodCalorie(food) {
  switch (food) {
    case "0 Chocolate Cake":
      {
        return 257.0;
      }

    case "1 Ice Cream":
      {
        return 207.0;
      }

    case "2 Sushi":
      {
        return 280.0;
      }

    case "3 Club_Sandwich":
      {
        return 591.0;
      }

    case "4 Fried Rice":
      {
        return 228.0;
      }

    default:
      {
        return 0.0.toDouble();
      }
      break;
  }
}
