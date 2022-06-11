class RaceItem {
  late final int? race_id;
  late final String race;

  RaceItem({
    required this.race_id,
    required this.race,
  });

  RaceItem.fromJsonMap(Map<String, dynamic> map)
      : race_id = map['race_id'] as int,
        race = map['race'] as String;

  Map<String, dynamic> toJsonMap() => {
        'race_id': race_id,
        'race': race,
      };
}
