class InseminationItem {
  late final int? insem_id;
  late final int insem_anml_id;
  late final String insemination_date;
  late final String add_date;

  InseminationItem({
    required this.insem_id,
    required this.insem_anml_id,
    required this.insemination_date,
    required this.add_date,
  });

  InseminationItem.fromJsonMap(Map<String, dynamic> map)
      : insem_id = map['insem_id'] as int,
        insem_anml_id = map['insem_anml_id'] as int,
        insemination_date = map['insemination_date'] as String,
        add_date = map['add_date'] as String;

  Map<String, dynamic> toJsonMap() => {
        'insem_id': insem_id,
        'insem_anml_id': insem_anml_id,
        'insemination_date': insemination_date,
        'add_date': add_date,
      };
}
