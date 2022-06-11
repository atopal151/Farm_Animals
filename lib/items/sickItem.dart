class SickItem {
  late final int? sick_id;
  late final int sick_anml_id;
  late final String sick_info;
  late final String sick_date;
  late final String add_date;

  SickItem({
    required this.sick_id,
    required this.sick_anml_id,
    required this.sick_info,
    required this.sick_date,
    required this.add_date,
  });

  SickItem.fromJsonMap(Map<String, dynamic> map)
      : sick_id = map['sick_id'] as int,
        sick_anml_id = map['sick_anml_id'] as int,
        sick_info = map['sick_info'] as String,
        sick_date = map['sick_date'] as String,
        add_date = map['add_date'] as String;

  Map<String, dynamic> toJsonMap() => {
        'sick_id': sick_id,
        'sick_anml_id': sick_anml_id,
        'sick_info': sick_info,
        'sick_date': sick_date,
        'add_date': add_date,
      };
}
