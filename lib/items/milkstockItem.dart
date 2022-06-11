class MilkItem {
   int? milk_id;
   String? liter;
   String? milking_date;
   String? animal_how;

  MilkItem({
     this.milk_id,
     this.liter,
     this.milking_date,
     this.animal_how,
  });

   MilkItem.withId({
     this.milk_id,
     this.liter,
     this.milking_date,
     this.animal_how,
   });

   Map<String, dynamic> toMap() {
     var map = Map<String, dynamic>();
     map["liter"] = liter;
     map["milking_date"] = milking_date;
     map["animal_how"] = animal_how;
     if (milk_id != null) {
       map["milk_id"] = milk_id;
     }
     return map;
   }

   MilkItem.fromObject(dynamic o) {
     this.milk_id=int.tryParse(o["milk_id"].toString());
     this.liter=o["liter"];
     this.milking_date=o["milking_date"];
     this.animal_how=o["animal_how"];
   }
}



