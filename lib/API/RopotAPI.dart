import 'dart:io';
import 'package:hospital_application/Models/roomModel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/RopotModel.dart';
import 'package:hospital_application/Models/token.dart';
Future<List<Ropot>> getRopot() async {
  final Dataa = await http
      .get(Uri.parse("http://192.168.0.105:443/Items/RobotAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        "token b194bda7a92bc7000d569b830a565a89a2b66993"
        //"token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(Dataa.body);
  List<Ropot> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(Ropot.fromJson(t));
  }
  print(ch_all.length.toString());
  return ch_all;
}
