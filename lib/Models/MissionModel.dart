import 'package:flutter/cupertino.dart';
import 'package:hospital_application/Models/Tasks.dart';

class mission {
  String _id="1";
 static String startTime=" " ;
 static int numTasks=0;
  static List<Tasks> taskss =new List<Tasks>();

  mission({String id, String numTasks, List<Tasks> tasks}) {
    this._id = id;
    //this._startTime = startTime;
    //this._numTasks = numTasks;
     //tasks=;
  }

  String get id => _id;
  set id(String id) => _id = id;

  //String get numTasks => _numTasks.toString();
  //set numTasks(String numTasks) => _numTasks = numTasks.toString();
  //List<Tasks> get tasks => _tasks;
  //set tasks(List<Tasks> tasks) => _tasks = tasks;

  mission.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    startTime = json['start_time'];
    numTasks = json['num_tasks'];
    if (json['tasks'] != null) {
      taskss = new List<Tasks>();
      json['tasks'].forEach((v) {
        taskss.add(new Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['start_time'] = startTime;
    data['num_tasks'] = numTasks.toString();
    if (taskss != null) {
      data['tasks'] = taskss.map((v) => v.toJson()).toList();
    }
    return data;
  }
}