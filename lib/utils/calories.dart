foodCalorie(food){
switch(food) { 
   case "0 Chocolate Cake": { 
      return 257; 
   } 
  
   case "1 Ice Cream": { 
      return 207; 
   } 

   case "2 Sushi":{
      return 280;
   }  

   case "3 Club_Sandwich":{
         return 591; 
   }

   case "4 Fried Rice":{
         return 228; 
   }

   default: { 
          return 0;
   }
   break; 
} 
}