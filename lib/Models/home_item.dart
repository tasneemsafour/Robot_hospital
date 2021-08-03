import 'package:flutter/material.dart';
class HomeItem {
  String title;
  String subtitle;
  String event;
  String img;
  int action;
  
  HomeItem({this.title, this.subtitle, this.event, this.img, this.action});
}

final  DummyHomeItems =  [
  HomeItem(
      title: "FOLLOW UP",
      subtitle: "Patients, Tesks, Reports",
      event: "",
      img: "assets/images/H1.jpg",
      action: 1
      ),

  HomeItem(
      title: "VIDEO CALL",
      subtitle: "Robot Start video call with patient ",
      event: "",
      img: "assets/images/H4.jpg",
      action: 4),
  HomeItem(
      title: "MAP",
      subtitle: "Robot going to somewhere",
      event: "",
      img: "assets/images/H3.jpg",
      action: 3),
  HomeItem(
      title: " CONTROLS",
      subtitle: " You can move the robot to anywhere or to do eny thing",
      event: " ",
      img: "assets/images/H5.jpg",
      action: 5),
  
  HomeItem(
      title: "SPEECH",
      subtitle: "Talk to robot",
      event: " ",
      img: "assets/images/H2.jpg",
      action: 2),
  
  HomeItem(
      title: "CHARGING",
      subtitle: "Charging places",
      event: "",
      img: "assets/images/H7.jpg",
      action: 6)
      ];