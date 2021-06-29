/**
import 'package:flutter/material.dart';
import 'package:hospital_application/Models/MissionModel.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';
import 'package:hospital_application/API/pushMissionAPI.dart' ;
class sort_TaskScreen extends StatefulWidget {


  static String routName = '/sort_TaskScreen';
  @override
  _sort_TaskScreenState createState() => _sort_TaskScreenState();
}

class _sort_TaskScreenState extends State<sort_TaskScreen> {
  //List<Map<String,String>> mm = mission.taskss;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mission"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
         ReorderableListView(
          children: List.generate(mm.length, (index) {
            return ListTile(
              key: UniqueKey(),
              title: Text(mm[index].keys.elementAt(0)),
            );
          }),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final Map<String,String> newString = mm.removeAt(oldIndex);
              mm.insert(newIndex, newString);

            });
          },
        ),
          GestureDetector(
            //width: MediaQuery.of(context).size.width*0.85,
              child: gradient_button("Send Mission"),
              onTap: () {
    }
          )
    ]
      ),
    );
  }
 **/