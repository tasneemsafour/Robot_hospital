import 'package:flutter/material.dart';

class controll_screen extends StatefulWidget {
  static String routName = '/controll_screen';
  @override
  _controll_screenState createState() => _controll_screenState();
}

class _controll_screenState extends State<controll_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("controll screen "),
      ),
    );
  }
}
