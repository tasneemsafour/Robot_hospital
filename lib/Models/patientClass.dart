import 'package:flutter/material.dart';

class Patient {
  int id;
  String image;
  String check_in;
  String check_out;
  String gender;
  int age;
  int mobile;
  String nationality;
  int user;
  int stay_room;
  String first_name;
  String last_name;
  String type;
  int Doctor;
  List<int> acessed_tasks;

  Patient({
    this.Doctor,
    this.first_name,
    this.last_name,
    this.type,
    this.id,
    this.image,
    this.check_in,
    this.check_out,
    this.gender,
    this.age,
    this.mobile,
    this.nationality,
    this.user,
    this.stay_room,
    this.acessed_tasks,
  });

  Patient.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    first_name = json["first_name"];
    last_name = json["last_name"];
    image = json["image"];
    type = json["type"];
    Doctor = json["Doctor"];
    check_in = json["check_in"];
    check_out = json["check_out"];
    gender = json["gender"];
    age = json["age"];
    mobile = json["mobile"];
    nationality = json["nationality"];
    user = json["user"];
    stay_room = json["stay_room"];
    //acessed_tasks=json["acessed_tasks"];
    print(id.toString());
  }
}
