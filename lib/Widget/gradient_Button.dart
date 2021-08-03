import 'package:flutter/material.dart';

class gradient_button extends StatelessWidget {
  final String name_but;

  gradient_button(this.name_but);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      //padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          //Colors.blue[300],
          Colors.indigo[200],
          Colors.blue[200],
        ]),
      ),
      child: Center(
        child: Text(
          name_but,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
