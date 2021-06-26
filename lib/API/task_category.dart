import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Models/token.dart';
Future<List<task_category>> getTaskCategory() async {
  print("///////////////////////////+"+ token.tokenName);
  String token2= "token "+token.tokenName;
  final taskData = await http
      .get(Uri.parse("http://193.227.20.84:443/Tasks/TaskTypeAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        //"token b194bda7a92bc7000d569b830a565a89a2b66993"
        token2
  });
  var jsonData = json.decode(taskData.body);
  List<task_category> task_all = [];

  for (var task in jsonData) {
    task_all.add(task_category.fromJson(task));
  }
  print(task_all.length.toString() + "cat ///////////");
  return task_all;
}
