import 'dart:io';
import 'package:hospital_application/Models/roomModel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
Future<List<Room>> getRoom() async {
  String token2= "token "+token.tokenName;

  final Dataa = await http
      .get(Uri.parse("http://193.227.20.84:443/Places/RoomAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: token2
  });
  var jsonData = json.decode(Dataa.body);
  List<Room> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(Room.fromJson(t));
  }
  return ch_all;
}
