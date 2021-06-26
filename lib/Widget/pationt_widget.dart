import 'package:flutter/material.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import '../Screens/patientProfile_screen.dart';
import '../Models/patientClass.dart';

class pationtItem extends StatelessWidget {
  Patient patient;

  pationtItem({this.patient});

  Widget _text(String title, Color color, double fontSize, String value) {
    return Text(
      "  " + title + " : " + value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(PationtProfile_screen.routeName, arguments: {
            "Patient": patient,
          });
        },
        child: Container(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              topLeft: Radius.circular(100.0),
            ),
            color: Colors.blue[200],
          ),
          child: Card(
            elevation: 50,
            margin: EdgeInsets.only(left: 15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0))),
                      child: Image.network(patient.image),
                      //child: CircleAvatar(
                      //radius: 10,
                      // backgroundImage: Image.network(patient.image),
                      // ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        _text(" Name ", Colors.white, 18,
                            patient.first_name + " " + patient.last_name),
                        SizedBox(
                          height: 25,
                        ),
                        _text("From", Colors.black, 12, patient.nationality),
                        _text("Check in", Colors.black, 12,
                            patient.check_in.toString()),
                        _text("Check out ", Colors.black, 12,
                            patient.check_out.toString()),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
