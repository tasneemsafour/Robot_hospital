import 'dart:io';
import 'package:hospital_application/Models/foodModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
Future<List<FoodItem>> getFood() async {
  String token2= "token "+token.tokenName;

  final Dataa = await http
      .get(Uri.parse("http://192.168.0.105:443/Items/FoodItemAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:token2
        //"token b194bda7a92bc7000d569b830a565a89a2b66993"
       // "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(Dataa.body);
  List<FoodItem> food_all = [];

  for (var t in jsonData) {
    food_all.add(FoodItem.fromJson(t));
  }
  print("0000000000000");
  return food_all;
}
