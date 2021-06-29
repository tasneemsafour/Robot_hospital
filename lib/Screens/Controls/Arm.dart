import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'anochor.dart';
import 'bone.dart';

class ArmPainter extends CustomPainter {
  final Anchor anchor ;
  ArmPainter(this.anchor);
  
  @override
  Void paint (Canvas canvas , Size size){
   Paint blueFill = Paint()
   ..color=Colors.blue[200]
   ..style=PaintingStyle.fill;
   
   Paint lightBlueFill = Paint()
   ..color = Colors.blue[100]
   ..style = PaintingStyle.fill;

   Paint lightBlueStrock =Paint()
   ..color = Colors.blue[100]
   ..style=PaintingStyle.stroke;

   Bone child = anchor.child;

   while(child !=null){
     canvas.drawCircle(child.getAttachPoint(), 10, lightBlueFill);
     canvas.drawLine(child.getAttachPoint(), child.parent.getAttachPoint(), lightBlueStrock);

   }
  }
  @override
  bool shouldRepaint (covariant CustomPainter oldDelegate){
    return true;
  }

}
class Arm extends StatelessWidget {
  final Anchor anchor ;
  const Arm ({Key key , this.anchor}):super (key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text ("s"),
        CustomPaint(
         painter: ArmPainter(anchor),),
        
    ],
    );
    
  }
}