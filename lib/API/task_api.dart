import 'dart:io';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
Future<List<Task>> getTask() async {
  String token2= "token "+token.tokenName;
  final taskData = await http
      .get(Uri.parse("http://192.168.0.105:443/Tasks/TaskAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: token2
        //"token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(taskData.body);
  List<Task> task_all = [];

  for (var task in jsonData) {
    task_all.add(Task.fromJson(task));
  }
  print(task_all.length.toString() + "///////////");
  return task_all;
}
