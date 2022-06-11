class MilchItem {
  late final int? milch_id;
  late final int milch_animals_id;
  late final String add_date;

  MilchItem({
    required this.milch_id,
    required this.milch_animals_id,
    required this.add_date,
  });

  MilchItem.fromJsonMap(Map<String, dynamic> map)
      : milch_id = map['milch_id'] as int,
        milch_animals_id = map['milch_animals_id'] as int,
        add_date = map['add_date'] as String;

  Map<String, dynamic> toJsonMap() => {
        'milch_id': milch_id,
        'milch_animals_id': milch_animals_id,
        'add_date': add_date,
      };
}
