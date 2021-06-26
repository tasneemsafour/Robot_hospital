import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hospital_application/Models/patientClass.dart';
import 'package:hospital_application/Screens/reports_Screen.dart';
//import '../../Models/dummyData.dart';
import 'package:hospital_application/Screens/Tasks_screen.dart';

class PationtProfile_screen extends StatelessWidget {
  static const routeName = '/pationtProfile';

  Widget _infoCol(String title, String info) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("  " + title + ": ", style: TextStyle(color: Colors.grey[500])),
          Text("  " + info,
              style: TextStyle(color: Colors.black54, fontSize: 18)),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget _btn(
      String title, String fun, BuildContext context, Patient patientID) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          width: double.infinity,
          child: FlatButton(
            onPressed: () {
              fun == "task"
                  ? addTaskFunction(context, patientID)
                  : _report(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            color: Colors.blue[200],
            height: 50,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SizedBox(
              height: 10,
            )),
      ],
    );
  }

  void addTaskFunction(BuildContext context, Patient patient) {
    // print(patient["patient"].id.toString() +
    //   "//" +
    //patient["category"].length.toString());
    Navigator.of(context).pushNamed(taskScreen.routName, arguments: {
      "id": patient.id,
    });
  }

  void _report(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Report_screen.routeName, arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    final patient =
        ModalRoute.of(context).settings.arguments as Map<String, Patient>;

    return Scaffold(
        appBar: AppBar(
          title: Text("Patient Profil"),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        backgroundColor: Colors.blue[200],
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          //SizedBox(height: MediaQuery.of(context).size.height*0.05),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05 * 3),
                height: MediaQuery.of(context).size.height * 0.14,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    topLeft: Radius.circular(50.0),
                  ),
                  color: Colors.white,
                ),
              ),
              Center(
                  child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0),
              )),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.25,
                child: CircleAvatar(
                    backgroundColor: Colors.blue[200],
                    radius: 10,
                    child: Image.network(patient["Patient"].image)),
              )),
            ],
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                " Patient ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          _infoCol("Nationality", patient["Patient"].nationality),
          _infoCol("Stay_room  ", patient["Patient"].stay_room.toString()),
          _infoCol("Check in   ", patient["Patient"].check_in.toString()),
          _infoCol("Check out  ", patient["Patient"].check_out.toString()),
          _infoCol("Age        ", patient["Patient"].age.toString()),
          _infoCol("Mobile     ", patient["Patient"].mobile.toString()),
          _infoCol("User       ", patient["Patient"].user.toString()),
          _btn("Add Task", "task", context, patient["Patient"]),
          _btn("History", "his", context, patient["Patient"]),
          _btn("Reports", "rep", context, patient["Patient"]),
        ])));
  }
}
