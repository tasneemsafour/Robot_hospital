import 'package:hospital_application/blocs/auth_events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
class mission_Api {
  String token2= "token "+token.tokenName;

  login(String mission) async {
    final response = await http.post(
        Uri.parse("http://193.227.20.84:443/api-token-auth/"),
        body: {"mission": mission},
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
