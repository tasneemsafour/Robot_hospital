import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/Tasks.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/patients_screen.dart';
import 'package:hospital_application/Models/MissionModel.dart';
class Mission {
static int  idtask = 0;
static int idMission =0 ;
  Mission.addMission(String NameTask, Map<String, String> m) {
    Tasks t = new Tasks ();
    //String s = json.encode(m);
    //print(s + " taskkkkkkkk");
    idtask++;
    t.id=(idtask).toString() ;
    t.taskName=m["task_name"];
    t.paint = m["id_patient"];
    t.arg1= m.values.elementAt(0);
    t.arg2= m.values.elementAt(1);
    print(t.arg1);
    mission.numTasks++;
    mission.taskss.add(t);

    print(mission.numTasks.toString() +
        "final mission" +
        mission.taskss.length.toString());
  }


  Mission.submitTask(
      BuildContext context, List<Task> task, List<task_category> cat) {
    //JSONObject  j = new Gson();
    mission m = new mission();
    m.id=(idMission+1).toString();
    m.startTime=DateTime.now().toString();
    Map<String, dynamic> data = m.toJson();
    String l = json.encode(data);
    //sendMission(l);
    Navigator.of(context).pushNamed(PationtScreen.routName,
        arguments: {"task": task, "task_category": cat});
    print(l);
  }
}
