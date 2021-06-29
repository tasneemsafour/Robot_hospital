import 'package:hospital_application/blocs/auth_events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
class Login_Api {
  login(String username, String password) async {
    final response = await http.post(
        Uri.parse("http://192.168.0.105:443/api-token-auth/"),
        body: {"username": username, "password": password},
        headers: {});
    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      //print(data['token']);
      return data;
    }
  }
}
