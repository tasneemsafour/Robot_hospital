import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Widget/drewer.dart';
import '../Widget/gridOfHome_widget.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/API/task_category.dart';

class Home_screen extends StatefulWidget {
  static const routName = '/Home_Screen';
  @override
  Home_screenState createState() => new Home_screenState();
}

class Home_screenState extends State<Home_screen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        drawer: drewer(),
        //backgroundColor: Colors.blue[200],
        body:
            //TODO Grid Dashboard
            GridDashboard());
  }
}
