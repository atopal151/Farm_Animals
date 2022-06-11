class TypeItem {
  late final int? type_id;
  late final String type;

  TypeItem({
    required this.type_id,
    required this.type,
  });

  TypeItem.fromJsonMap(Map<String, dynamic> map)
      : type_id = map['type_id'] as int,
        type = map['type'] as String;

  Map<String, dynamic> toJsonMap() => {
        'type_id': type_id,
        'type': type,
      };
}
