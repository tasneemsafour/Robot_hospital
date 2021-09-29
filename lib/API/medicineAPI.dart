import 'dart:io';
import 'package:hospital_application/Models/MedicineModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';

Future<List<medicine>> getMedicin() async {
  String token2 = "token " + tokenAPI.tokenName;

  final dataa =
      await http.get(Uri.parse(tokenAPI.url + "/Items/MedicineAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: token2
  });
  var jsonData = json.decode(dataa.body);
  List<medicine> med_all = [];

  for (var t in jsonData) {
    med_all.add(medicine.fromJson(t));
  }
  print(med_all[0].name);
  return med_all;
}
