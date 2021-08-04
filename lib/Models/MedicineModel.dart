class medicine {
  int id;
  String name;
  String type;
  String image;
  int count;
  int pharmacy;

  medicine(
      {this.id, this.name, this.type, this.count, this.image, this.pharmacy});

  medicine.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    type = json["type"];
    image = json["image"];
    count = json["count"];
    pharmacy = json["pharmacy"];
  }
}
