class Task {
  int id;
  String name;
  int task_type;
  bool check = false;

  Task({this.id, this.name, this.task_type, this.check});

  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    task_type = json["task_type"];
    print(id.toString() + "/////////////" + name.toString());
  }

}
