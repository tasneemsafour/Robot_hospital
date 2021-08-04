class FoodItem {
  int id;
  String name;
  double fats_gram;

  FoodItem({this.id, this.name, this.fats_gram});

  FoodItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    fats_gram = json["fats_gram"];
  }
}
