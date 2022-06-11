class NotMilkingItem {
  late final int? notmilking_id;
  late final int notmilking_anl_id;
  late final String add_date;

  NotMilkingItem({
    required this.notmilking_id,
    required this.notmilking_anl_id,
    required this.add_date,
  });

  NotMilkingItem.fromJsonMap(Map<String, dynamic> map)
      : notmilking_id = map['notmilking_id'] as int,
        notmilking_anl_id = map['notmilking_anl_id'] as int,
        add_date = map['add_date'] as String;

  Map<String, dynamic> toJsonMap() => {
        'notmilking_id': notmilking_id,
        'notmilking_anl_id': notmilking_anl_id,
        'add_date': add_date,
      };
}
