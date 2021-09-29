import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';

class mission_Api {
  String token2 = "token " + tokenAPI.tokenName;

  sendMission(String l) {
    final response =
        http.post(Uri.parse(tokenAPI.url + "/Tasks/sendmission/"), body: {
      "mission": l
    }, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token2
    });
    /*
    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      //print(data['token']);
      return data;
    }
    */
  }
}
