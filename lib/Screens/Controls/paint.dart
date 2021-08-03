import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body :Center(
      child: CustomPaint( //                       <-- CustomPaint widget
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    ));
  }
}

class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
  final pointMode = ui.PointMode.points;
  final points = [
    Offset(50, 100),
    Offset(150, 75),
    Offset(250, 250),
    Offset(130, 200),
    Offset(270, 100),
  ];
  final paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;

  canvas.drawPoints(pointMode, points, paint);

    
    Paint blueFill = Paint()
   ..color=Colors.blue[200]
   ..style=PaintingStyle.fill;
   
   Paint lightBlueFill = Paint()
   ..color = Colors.blue[100]
   ..style = PaintingStyle.fill;

   Paint lightBlueStrock =Paint()
   ..color = Colors.blue[100]
   ..style=PaintingStyle.stroke;

  final center = Offset(150, 150);
  final radius = 100.0;
  final paint2 = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;
  canvas.drawCircle(center, radius, paint2);



    
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}