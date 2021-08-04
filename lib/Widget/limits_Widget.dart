/***
import 'package:flutter/material.dart';
class LimitsWidget extends StatefulWidget {


  @override
  _LimitsWidgetState createState() => _LimitsWidgetState();
}

class _LimitsWidgetState extends State<LimitsWidget> {
  static final minList=[];

  static final maxList=[];

  final minValControl = TextEditingController();

  final maxValControl = TextEditingController();

  void submitLimits(BuildContext context) {
    final minval = double.parse(minValControl.text);
    final maxval = double.parse(maxValControl.text);
    if ( minval < 0 || maxval <0 ) {
      return;
    }
    minList.add(minval);
    maxList.add(maxval);
   //Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container (
      padding: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height*0.13,
      width: MediaQuery.of(context).size.width,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                        color: Colors.grey[200]),
                  width: 100,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(labelText: '  min'),
                    keyboardType: TextInputType.number,
                    controller: minValControl,
                    onSubmitted: (_) => submitLimits(context),
                    ),
                ),
                Container(
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                        color: Colors.grey[200]),
                  height: 50,
                  width:100,
                  child: TextField(
                    decoration: InputDecoration(labelText: '  max'),
                    keyboardType: TextInputType.number,
                    controller: maxValControl,
                    onSubmitted: (_) => submitLimits(context),
                        ),
                     ),
                    ],
          )
    )
    ) ;
  }
}
    **/