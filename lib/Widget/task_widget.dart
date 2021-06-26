import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/chek_task.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Models/patientClass.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/taskParameter.dart';

class task_widget extends StatefulWidget {
  List<Task> task;
  int patientid;
  task_category taskcat;
  task_widget({this.taskcat, this.task, this.patientid});

  @override
  _task_widgetState createState() => _task_widgetState();
}

class _task_widgetState extends State<task_widget> {
//static List<bool> checkval = List<bool>.filled(50, false) ;

  onClicked(int index) {
    print("000");
    setState(() {
      bool newValue = widget.task[index].check;
      widget.task[index].check = newValue;

      if (!newValue) {
        widget.task[index].check = newValue;
      } else {
        widget.task[index].check = newValue;
        // go to task parameter
        Navigator.of(context).pushNamed(taskParameter.routName, arguments: {
          "task": widget.task[index],
          "patientid": widget.patientid
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.task.length * 40).toDouble(),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.task.length,
        itemExtent: 40,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              onClicked(index);
            },
            leading: Checkbox(
                value: this.widget.task[index].check,
                onChanged: (bool value) {
                  setState(
                    () {
                      if (!value) {
                        this.widget.task[index].check = value;
                      } else {
                        this.widget.task[index].check = value;
                        check_task m = new check_task();
                        m.getparameter(widget.task[index].name,
                            widget.patientid, widget.taskcat, context);
                        /*
                        Navigator.of(context).pushNamed(taskParameter.routName,
                            arguments: {
                              "task": widget.task[index],
                              "patientid": widget.patientid
                            });
                            */
                        //go to task parameter
                      }
                      // this.widget.task[index].check = value;
                    },
                  );
                }),
            title: Text(
              widget.task[index].name,
              style: TextStyle(fontSize: 15),
            ),
          );
        },
      ),
    );
  }
}
