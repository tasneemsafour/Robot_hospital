import 'dart:io';
import 'package:hospital_application/Models/chargingStationModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/chargingStationModel.dart';
import 'package:hospital_application/Models/token.dart';
Future<List<chargingStation>> getChargingStation() async {
  String token2= "token "+token.tokenName;

  final Dataa = await http.get(
      Uri.parse(token.url+"/Places/ChargingStationAPI/"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:token2

      });
  var jsonData = json.decode(Dataa.body);
  List<chargingStation> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(chargingStation.fromJson(t));
  }
  return ch_all;
}
