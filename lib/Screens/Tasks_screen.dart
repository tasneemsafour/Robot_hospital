import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/API/task_category.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Models/patientClass.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';
import 'package:hospital_application/Widget/task_widget.dart';
import 'package:hospital_application/blocs/auth_state.dart';
import '../API/task_api.dart';
import '../Models/Task_Model.dart';
import 'package:hospital_application/Screens/before_mission.dart';

class taskScreen extends StatefulWidget {
  // const taskScreen({Key key}) : super(key: key);
  static String routName = '/taskScreen';
  @override
  _taskScreenState createState() => _taskScreenState();
}

List<Mission> missionList = new List();

class _taskScreenState extends State<taskScreen> {
  @override
  initState() {
    /*
    print("11111111111111111111111111111111111111111111111111111111111111");
    getTask().then((result) {
      setState(() => task_all = result);
    });
    print(task_all.length.toString() + "tasks");
    getTaskCategory().then((result) {
      setState(() => taskCategory_all = result);
    });
    print(taskCategory_all.length.toString() + "cat");
    print("11111111111111111111111111111111111111111111111111111111111111");
    //print(getTaskCategory.length);
    */
    super.initState();
  }

  //List<bool> listview = [false, false, false, false, false, false, false];
  List<Task> getTaskCat(task_category CategoryId, List<Task> task_all) {
    List<Task> taskWithCategory = new List();
    print("getTaskCat");
    for (var t in task_all) {
      if (t.task_type == CategoryId.id) {
        taskWithCategory.add(t);
      }
    }
    return taskWithCategory;
  }

  Widget getttTask(List<task_category> cat, int patientID) {
    return Container(
        child: FutureBuilder(
      future: getTask(),
      builder: (BuildContext context, AsyncSnapshot snapshot22) {
        if (snapshot22.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                listTasksCheck(cat, snapshot22.data, patientID),
                /*
                Column(
                    children: snapshot22.data
                        .map((category) =>
                            columncat(category, snapshot22.data, patientID))
                        .toList()),
                        */
                Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  child: GestureDetector(
                      //width: MediaQuery.of(context).size.width*0.85,
                      child: gradient_button("Send Task"),
                      onTap: () {
                       // Mission.submitTask(context);
                        Navigator.of(context).pushNamed(
                          sort_TaskScreen.routName,
                        );

                        //Navigator.of(context).pop(context);
                      }),
                ),
              ],
            ),
          );
        }
      },
    ));
  }

  Widget columncat(
      task_category taskCategory_all, List<Task> task, int PatientID) {
    print("columncat");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          //child: GestureDetector(
          child: Text(
            taskCategory_all.name,
            style: TextStyle(
                //te :start,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        //Text("111")
        Container(
            child: task_widget(
                taskcat: taskCategory_all,
                task: getTaskCat(taskCategory_all, task),
                patientid: PatientID)),
      ],
    );
  }

  listTasksCheck(
      List<task_category> taskCategory_all, List<Task> task, int patientID) {
    //missionList = Mission.mission.cast<Mission>();
    return Column(
        children: taskCategory_all
            .map((category) => columncat(category, task, patientID))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    final patientID =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        child: FutureBuilder(
            future: getTaskCategory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                //return getttTask(snapshot.data, patientID["id"]);
              return getttTask(snapshot.data, 5);
              }
            }),
      ),
    );
  }
}
