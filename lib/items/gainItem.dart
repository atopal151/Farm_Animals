
class GainItem {
  int? gain_id;
  int? type_id;
  String? gain_info;
  String? add_date;

  GainItem({
     this.gain_id,
     this.type_id,
     this.gain_info,
     this.add_date,
  });

  GainItem.withId({
    this.gain_id,
    this.type_id,
    this.gain_info,
    this.add_date,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["type_id"] = type_id;
    map["gain_info"] = gain_info;
    map["add_date"] = add_date;
    if (gain_id != null) {
      map["id"] = gain_id;
    }
    return map;
  }

  GainItem.fromObject(dynamic o) {
    this.gain_id=int.tryParse(o["gain_id"].toString());
    this.type_id=o["type_id"];
    this.gain_info=o["gain_info"];
    this.add_date=o["add_date"];
  }
}


