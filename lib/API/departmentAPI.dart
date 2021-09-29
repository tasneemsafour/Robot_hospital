import 'dart:io';
import 'package:hospital_application/Models/chargingStationModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/chargingStationModel.dart';
import 'package:hospital_application/Models/token.dart';

Future<List<chargingStation>> getdepartment() async {
  String token2 = "token " + tokenAPI.tokenName;

  final Dataa = await http
      .get(Uri.parse(tokenAPI.url + "/Places/Places/DepartmentAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: token2
    // "token b194bda7a92bc7000d569b830a565a89a2b66993"
    //"token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(Dataa.body);
  List<chargingStation> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(chargingStation.fromJson(t));
  }
  return ch_all;
}
