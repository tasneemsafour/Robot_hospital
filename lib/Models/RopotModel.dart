class Ropot {
  int id;
  String status;
  int base_location;

  Ropot({
    this.id,
    this.status,
    this.base_location,
  });

  Ropot.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    status = json["status"];
    base_location = json["base_location"];
  }
}
