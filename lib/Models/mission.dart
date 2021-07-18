import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_application/API/pushMissionAPI.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/Tasks.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/home-screen.dart';
import 'package:hospital_application/Screens/patients_screen.dart';
import 'package:hospital_application/Models/MissionModel.dart';
class Mission {
static int  idtask = 0;
static int idMission =0 ;
  Mission.addMission(String NameTask, Map<String, String> m , String patient) {
    Tasks t = new Tasks ();
    //String s = json.encode(m);
    //print(s + " taskkkkkkkk");
    idtask++;
    t.id=(idtask).toString() ;
    t.taskname=NameTask;
    t.paint =patient;
    t.arg1= m.values.elementAt(0);
    t.arg2= m.values.elementAt(1);
    print(t.arg1);
    mission.numTasks++;
    mission.taskss.add(t);

    print(mission.numTasks.toString() +
        "final mission" +
        mission.taskss.length.toString());
  }


  Mission.submitTask(BuildContext context) {
    //JSONObject  j = new Gson();
    mission m = new mission();
    idMission++;
    m.id=(idMission).toString();
    Map<String, dynamic> data = m.toJson();
    String l = json.encode(data);
    mission_Api api = new mission_Api();
    api.sendMission(l);
    Navigator.of(context).pushNamed(Home_screen.routName);
    print(l);
  }
}
