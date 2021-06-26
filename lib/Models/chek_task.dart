import 'package:flutter/material.dart';
import 'package:hospital_application/API/medicineAPI.dart';
import 'package:hospital_application/Models/MedicineModel.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/MapScreen.dart';
import 'package:hospital_application/Screens/taskParameter.dart';
import 'package:hospital_application/Screens/foodScreen.dart';
import 'package:hospital_application/Screens/medicineScreen.dart ';
import 'package:hospital_application/Screens/charging_screen.dart';
import 'package:hospital_application/Screens/controll_screen.dart';

class check_task {
  String taskName;
  int patientId;
  task_category categoryTask;
  check_task({this.taskName, this.categoryTask, this.patientId});

  getparameter(String taskName, int patientId, task_category categoryTask,
      BuildContext context) {
    if (taskName == "investigate crona") {
      Map<String, String> m = {
        "id_invistegation_type": "crona_investegation",
        "id_patient": patientId.toString()
      };
      Mission.addMission("investigate crona", m);
    } else if (taskName == "investigate fever") {
      Map<String, String> m = {
        "id_invistegation_type": "favor_investegation",
        "id_patient": patientId.toString()
      };
      Mission.addMission("investigate fever", m);
    } else if (taskName == "scan report (OCR)") {
      print("nn");
      Map<String, String> m = {
        "service_type": "scan_OCR",
        "id_patient": patientId.toString()
      };
      Mission.addMission("scan report (OCR)", m);
      print("22");
    } else if (taskName == "scan heart pulses") {
      Map<String, String> m = {
        "service_type": "scan_heart_pulses",
        "id_patient": patientId.toString()
      };
      Mission.addMission("scan heart pulses", m);
    } else if (taskName == "medicine recognition") {
      Navigator.of(context).pushNamed(medicineScreen.routName, arguments: {
        "task": taskName,
        "patientid": patientId,
      });
    } else if (taskName == "ask patient") {
      Navigator.of(context).pushNamed(taskParameter.routName, arguments: {
        "task": taskName,
        "patientid": patientId,
        "text": "questions",
      });
    } else if (taskName == "food_order") {
      Navigator.of(context).pushNamed(foodScreen.routName, arguments: {
        "task": taskName,
        "patientid": patientId,
        "text": "questions",
      });
    } else if (taskName == "display to location X to Y") {
      Navigator.of(context).pushNamed(MapScreen.routName, arguments: {});
    } else if (taskName == "hand control") {
      Navigator.of(context).pushNamed(controll_screen.routName, arguments: {});
    } else if (taskName == "go to charging station") {
      Navigator.of(context).pushNamed(chargingScreen.routName, arguments: {});
    }
  }
}
