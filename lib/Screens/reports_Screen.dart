import 'package:flutter/material.dart';
import 'package:hospital_application/Models/patientClass.dart';
import 'package:hospital_application/Widget/gridOfHome_widget.dart';
import '../Widget/report_widget.dart';
class Report_screen extends StatelessWidget {
 
  Patient patient;
  Report_screen ({this.patient});
  
  static const routeName = '/ReportScren';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemBuilder: (ctx,index) {
          return reportItem (reportImag: patient.acessed_tasks[index].toString());
           },
           itemCount:patient.acessed_tasks.length,
         );
  }
}