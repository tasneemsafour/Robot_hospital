import 'dart:math';
import 'dart:ui';

import 'attachable.dart';
import 'bone.dart';

class Anchor extends Attachable {
  Offset loc;
  Bone child;

   Anchor({this.loc});

  @override
  Offset getAttachPoint() {
    return loc;
  }
  void solve(Offset target){
    Bone bone1=child;
    Bone bone2=bone1.child;

    bone1.angle=(target-loc).direction;
    bone2.angle=(target-loc).direction;


  }
}