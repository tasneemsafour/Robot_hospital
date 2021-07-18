import 'dart:io';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
Future<List<Task>> getquestion() async {
  String token2= "token "+token.tokenName;

  final taskData = await http
      .get(Uri.parse(token.url+"/Tasks/TaskAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        // "token b194bda7a92bc7000d569b830a565a89a2b66993"
        token2
  });
  var jsonData = json.decode(taskData.body);
  List<Task> task_all = [];

  for (var task in jsonData) {
    task_all.add(Task.fromJson(task));
  }
  print(task_all.length.toString() + "///////////");
  return task_all;
}
