class Person {
  int id;
  String first_name;
  String last_name;
  String image;
  String type;
  int user;
  List<int> acessed_tasks;

  Person(
      {this.id,
      this.acessed_tasks,
      this.first_name,
      this.image,
      this.last_name,
      this.user,
      this.type});

  Person.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    first_name = json["first_name"];
    type = json["type"];
    last_name = json["last_name"];
    image = json["image"];
    type = json["type"];
    //acessed_tasks = json["acessed_tasks"];
  }
}
