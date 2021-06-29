import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/blocs/auth_events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
class mission_Api {
  String token2= "token "+token.tokenName;

  sendMission(String l)  {
    final response =  http.post(
        Uri.parse("http://192.168.0.105:443/Tasks/sendmission/"),
        body: {"mission":l},
        headers: {});
    /*
    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      //print(data['token']);
      return data;
    }
    */

  }
}
