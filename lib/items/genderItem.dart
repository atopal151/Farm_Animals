class GenderItem {
  late final int? gain_id;
  late final int type_id;
  late final String gain_info;
  late final String add_date;

  GenderItem({
    required this.gain_id,
    required this.type_id,
    required this.gain_info,
    required this.add_date,
  });

  GenderItem.fromJsonMap(Map<String, dynamic> map)
      : gain_id = map['gain_id'] as int,
        type_id = map['type_id'] as int,
        gain_info = map['gain_info'] as String,
        add_date = map['add_date'] as String;

  Map<String, dynamic> toJsonMap() => {
        'gain_id': gain_id,
        'type_id': type_id,
        'gain_info': gain_info,
        'add_date': add_date,
      };
}
