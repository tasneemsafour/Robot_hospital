class task_category {
  int id;
  String description;
  String name;

  task_category({this.id, this.description, this.name});

  task_category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    description = json["description"];
    name = json["name"];
    print(id.toString() + "/////////////" + name.toString());
  }
}
