
class UsersItem {
  late final int? user_id;
  late final String user_name;
  late final String img_path;
  late final String add_date;

  UsersItem({
    required this.user_id,
    required this.user_name,
    required this.img_path,
    required this.add_date,
  });

  UsersItem.fromJsonMap(Map<String, dynamic> map)
      : user_id = map['user_id'] as int,
        user_name = map['user_name'] as String,
        img_path = map['img_path'] as String,
        add_date = map['add_date'] as String;

  Map<String, dynamic> toJsonMap() => {
    'user_id': user_id,
    'user_name': user_name,
    'img_path': img_path,
    'add_date': add_date,
  };
}
