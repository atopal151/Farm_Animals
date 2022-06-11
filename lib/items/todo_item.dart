class TodoItem {
  int? id;
  String? content;
  int? isDone;
  int? createdAt;

  TodoItem({
    this.id,
    this.content,
    this.isDone,
    this.createdAt,
  });

  TodoItem.withId({
    this.id,
    this.content,
    this.isDone = 1,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["content"] = content;
    map["isDone"] = isDone;
    map["createdAt"] = createdAt;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  TodoItem.fromObject(dynamic o) {
    this.id=int.tryParse(o["id"].toString());
    this.content=o["content"];
    this.isDone=o["isDone"];
    this.createdAt=o["createdAt"];
  }
}


