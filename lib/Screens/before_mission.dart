
import 'package:flutter/material.dart';
import 'package:hospital_application/Models/MissionModel.dart';
import 'package:hospital_application/Models/Tasks.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';
import 'package:hospital_application/API/pushMissionAPI.dart' ;
class sort_TaskScreen extends StatefulWidget {


  static String routName = '/sort_TaskScreen';
  @override
  _sort_TaskScreenState createState() => _sort_TaskScreenState();
}


class _sort_TaskScreenState extends State<sort_TaskScreen> {
  List<Tasks> mm = mission.taskss;
  //var mm;

  recordList(){
    return Container(
      height: (60*(mm.length)).toDouble(),
      child: ReorderableListView(
        children: List.generate(mm.length, (index) {
          return  ListTile(
              key: UniqueKey(),
              //title: Text(mm[index].keys.elementAt(0)),
              title: Text(mm[index].taskname.toString())
          );
        }),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final Tasks newString = mm.removeAt(oldIndex);
           // final String newString = mm.removeAt(oldIndex);
            mm.insert(newIndex, newString);
          });
        },
      ),
    );
  }
  String dateee="Mission Date";
  DateTime _dateTime;
  DateeTime(){
  return ListTile(
    trailing: IconButton(
      icon:Icon( Icons.date_range),
      onPressed: (){
    showDatePicker(
    context: context,
    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
    firstDate: DateTime(2021),
    lastDate: DateTime(2022)
    ).then((date) {
    setState(() {
    _dateTime = date;
    dateee =_dateTime.year.toString() +"-"+_dateTime.month.toString() +"-"+_dateTime.day.toString();
    mission.startTime=dateee;
    });
        });
      },
    ),
    title: Text(dateee),
  );
  }
  TimeOfDay time = new TimeOfDay.now();
  String time2="Mission time" ;
  Future<Null> selectTime(BuildContext context) async
  {
    final TimeOfDay picked =await showTimePicker(context: context, initialTime: time);
    if (picked!=null){
      setState(() {
        time=picked;
        time2 = time.hour.toString()+":"+time.minute.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mission"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: SingleChildScrollView(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateeTime(),
                ListTile(
                    trailing: IconButton(
                        icon:Icon( Icons.access_alarm),
                      onPressed: (){
                          selectTime(context);
                      },
                    ),
                  title:Text(time2),
                ),
                recordList(),
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  height:50,
                  child: GestureDetector(
                      child: gradient_button("Send Mission"),
                      onTap: () {
                        mission.startTime= dateee+ " " +time2 ;
                        mission.taskss=mm;
                        Mission.submitTask(context);
                        for (int i=0 ;i<mm.length ;i++)
                          {
                            print(mm[i]);
                          }
                      }
                  ),
                )
              ]
          ),
      ),
    );
  }
}