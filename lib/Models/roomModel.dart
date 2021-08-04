class Room {
  int id;
  int number;
  String type;
  bool avilibility;
  int floor;
  int main_anchor;
  int beacon;

  Room(
      {this.id,
      this.avilibility,
      this.beacon,
      this.floor,
      this.main_anchor,
      this.number,
      this.type});

  Room.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    number = json["number"];
    type = json["type"];
    floor = json["floor"];
    avilibility = json["avilibility"];
    main_anchor = json["main_anchor"];
    beacon = json["beacon"];
  }
}
