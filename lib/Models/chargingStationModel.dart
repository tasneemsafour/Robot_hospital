class chargingStation {
  int id;
  int number;
  int floor;
  int main_anchor;

  chargingStation({this.id, this.floor, this.main_anchor, this.number});

  chargingStation.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    number = json["number"];
    floor = json["floor"];
    main_anchor = json["main_anchor"];
  }
}
