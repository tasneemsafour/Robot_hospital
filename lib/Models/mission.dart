import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/patients_screen.dart';

class Mission {
  static List<Map<String, String>> mission = new List<Map<String, String>>();
  static List<String> nameTask = new List<String>();
  String taskName;
  String id;
  String start_time = DateTime.now().toString();
  String num_task;

  Mission({this.taskName});

  Mission.addMission(String NameTask, Map<String, String> m) {
    //String s = json.encode(m);
    //print(s + " taskkkkkkkk");
    nameTask.add(NameTask);
    mission.add(m);
    print(mission.length.toString() +
        "final mission" +
        nameTask.length.toString());
  }

  List<Mission> showMission() {
    //return mission;
  }
  Mission.submitTask(
      BuildContext context, List<Task> task, List<task_category> cat) {
    //JSONObject  j = new Gson();
    String l = json.encode(mission);
    Map<String, String> m = {
      "id": "1",
      "start_time": DateTime.now().toString(),
      "#task": mission.length.toString(),
      "tasks": l,
    };
    String finalMission = json.encode(m);
    Navigator.of(context).pushNamed(PationtScreen.routName,
        arguments: {"task": task, "task_category": cat});
    print(finalMission);
  }
}
