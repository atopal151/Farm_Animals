

class AnimalsItem {
  int? anl_id;
  String? animals_number;
  String? animals_name;

  AnimalsItem({
    this.anl_id,
    this.animals_number,
    this.animals_name,
  });

  AnimalsItem.withId({
    this.anl_id,
    this.animals_number,
    this.animals_name,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["animals_number"] = animals_number;
    map["animals_name"] = animals_name;
    if (anl_id != null) {
      map["anl_id"] = anl_id;
    }
    return map;
  }

  AnimalsItem.fromObject(dynamic o) {
    this.anl_id=int.tryParse(o["anl_id"].toString());
    this.animals_number=o["animals_number"];
    this.animals_name=o["animals_name"];
  }

}

