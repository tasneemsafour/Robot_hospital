import 'package:flutter/material.dart';
import '../Widget/pationt_widget.dart';
import 'dart:io';
import '../Models/patientClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../API/patient_api.dart';

class PationtScreen extends StatelessWidget {
  static const routName = '/pationtScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patients"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        child: FutureBuilder(
            future: gitAllPatients(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return pationtItem(patient: snapshot.data[index]);
                  },
                );
              }
            }),
      ),
    );
  }
}
