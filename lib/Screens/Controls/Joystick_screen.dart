import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:hospital_application/Screens/Controls/controlSliders_widgit.dart';
import 'package:hospital_application/Screens/Controls/setting_screen.dart';
import 'anochor.dart';
import 'bone.dart';
import 'setting_screen.dart';
import 'attachable.dart';
import 'Arm.dart';
import 'package:joystick/joystick.dart';
import './dart_ampq.dart';
import 'package:hospital_application/blocs/auth_events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_switch/flutter_switch.dart';

class Joystick_screen extends StatefulWidget {
static String routeName='/joystick';
  @override
  _Joystick_screenState createState() => _Joystick_screenState();
}

class _Joystick_screenState extends State<Joystick_screen> {
    
    String ip ='192.168.0.105:443';
    String eventStr;
    bool leftbool=false;
    bool rightbool=false;
    bool mouthtbool=true;
    var deuration = const Duration( milliseconds: 250);
    double min =0 ;
    double max=180;
    static List<TextEditingController> Controlslist = List.generate(10, (i) => TextEditingController()) ;
    static Map< String , TextEditingController > controlls = {
    "leftHand": Controlslist[0] ,
    "rightHand": Controlslist[1] ,
    "leftHalfArm": Controlslist[2] ,
    "rightHalfArm": Controlslist[3] ,
    "leftArmX": Controlslist[4] ,
    "rightArmX": Controlslist[5] ,
    "leftArmY": Controlslist[6] ,
    "rightArmY": Controlslist[7] ,
    "ip":Controlslist[8]};
    Map <String ,dynamic > event;
 
   sendDirections(Map <String , dynamic > eventVal) async {
    final response = await http.post(
        Uri.parse( 'http://192.168.0.105:443/Tasks/SendMotion/'),
        body: {'direction': eventVal },
        headers: {}
       );
   }
     sendDirections2(String eventVal) async {
    final response = await http.post(
        Uri.parse( 'http://192.168.0.105:443/Tasks/SendMotion/'),
        body: {'direction': eventVal },
        headers: {});
   }
   //head
   _iconBtn ( IconData iconbtn,String direction){
     return Container(
      height: 50,
      width: 50,
      child: FlatButton(
              onPressed: (){
                setState(() {
                      event= {"head to "+direction:1};
                      sendDirections(event);
                      print(event);});},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              height: 50,
              child:Icon(iconbtn , color:Colors.blue[200],size: 50,), 
            ), 
     );
   }
   
   String eventstr;
   //boby
   JoystickDirectionCallback onDirectionChanged(
      double degrees, double distance) {
      print( "Degree : ${degrees.toStringAsFixed(2)}, Distance : ${distance.toStringAsFixed(2)}");
      eventstr="Degree : ${degrees.toStringAsFixed(2)}, Distance : ${distance.toStringAsFixed(2)}";
      sendDirections2(eventstr);
      //main(eventStr);
   }

   //hand and mouth
   Myswitch(String diriction , bool boolval){
     return Switch(
            activeColor:Theme.of(context).accentColor, 
            value: boolval, 
            onChanged:(newValue) {
              setState((){
              boolval = newValue;

              event = {diriction: boolval};
              print( diriction + event.toString());
              sendDirections(event);
              });});
   }
   //arms
   btn (double position , TextEditingController control1, TextEditingController control2, String diriction1 , String diriction2 ){
     return FlatButton(
            child: Icon(Icons.settings,color: Colors.blueGrey),
            onPressed: (){
              showModalBottomSheet<void>(
                context: context,
                builder: (
                  BuildContext context) {
                    return SingleChildScrollView(
                    child:Container(
                          //height: MediaQuery.of(context).size.height*0.5,
                          child:Column(
                          children :[
                           SliderWidget( max: max,  min: min,tec:control1,),
                           SliderWidget( max: max,  min: min,tec:control2,),
                           Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  child:FlatButton(
                                    onPressed: (){
                                      event =  {diriction1 :control1.text};
                                      sendDirections(event);
                                      print(event);
                                      event =  {diriction2 :control2.text};
                                      sendDirections(event);
                                      print(event);
                                    },
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                    color: Theme.of(context).accentColor,
                                    height: 50,
                                    child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  ),
                ),
              ])
             ),
           );
          }
        );
      }
     );
   }
 
 
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Theme.of(context).accentColor,
       title:Text("Robot Control",style: TextStyle (color: Colors.white))),
     body: Center(
       child: Container(
         color: Colors.white,
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: Column(
           children: [
           //ip
            /*Container(
                width: 250,
                child: TextField(
                decoration: InputDecoration(labelText:"movement name"),
                controller: controlls['ip'] ,
                onSubmitted:(_){ ip=controlls["ip"].text.toString();} ,
      ),),*/
            //Camera and mouth
       /*     Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               action("name",Icons.camera_alt_rounded, cameraMotion , 40),
            ],),
*/
  
             Container(
              padding: EdgeInsets.only(top: 100 ),
              child: Stack(
                children: [ 
                   //image 
                    Container(
                      padding: EdgeInsets.only(left: 100 ),
                      height: MediaQuery.of(context).size.height*0.5,
                     // width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/roboot.jpeg',fit:BoxFit.fill),
                    ),

                    //mouth
                     Container(
                      margin: EdgeInsets.only(top: 60,left: MediaQuery.of(context).size.width*0.4,),
                     // width: MediaQuery.of(context).size.width,
                      child: Switch(
                          activeColor:Theme.of(context).accentColor, 
                          value: mouthtbool, 
                          onChanged:(newValue) {
                            setState((){
                            mouthtbool = newValue;
                            event = {'mouth is ': mouthtbool};
                            print( event.toString());
                            sendDirections(event);
                            });}),),
                    //Head 
                    Container(
                      margin: EdgeInsets.only(top:25,left: MediaQuery.of(context).size.width*0.21,),
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                      _iconBtn(Icons.arrow_left,"left"),
                      SizedBox(width: 70,),
                      _iconBtn(Icons.arrow_right,"right"),])),
                    //Hand
                    Container(
                      margin: EdgeInsets.only(top: 200 ,left: MediaQuery.of(context).size.width*0.22,),
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                         //left hand 
                      Switch(
                          activeColor:Theme.of(context).accentColor, 
                          value: leftbool, 
                          onChanged:(newValue) {
                            setState((){
                            leftbool = newValue;
                            event = {'left hand is ': leftbool};
                            print( event.toString());
                            sendDirections(event);
                            });}),
                      SizedBox(width: 60,),
                         //right hand 
                      Switch(
                          activeColor:Theme.of(context).accentColor, 
                          value: rightbool, 
                          onChanged:(newValue) {
                            setState((){
                            rightbool = newValue;
                            event = {'right hand is ': rightbool};
                            print( event.toString());
                            sendDirections(event);
                            });}),
                        ]
                      ),
                    ),

                    //body
                    Container(
                      margin:EdgeInsets.only(top:300.0,),
                      child: JoystickView(
                      interval:  deuration,
                      size: 150,
                      onDirectionChanged: onDirectionChanged,
                      backgroundColor: Colors.white,
                      innerCircleColor: Theme.of(context).accentColor,
                      showArrows: false,  )),
                    
                   //Arms 
                    //top 
                 Container(
                    margin: EdgeInsets.only(top: 70 ,left: MediaQuery.of(context).size.width*0.22,),
                    width: MediaQuery.of(context).size.width,
                    child :Row(children: [
                       btn(70, controlls['leftArmX'], controlls['leftArmY'],"leftArmX","leftArmY"),
                       SizedBox(width: 15,),
                       btn(70, controlls['rightArmX'], controlls['rightArmY'],"rightArmX","rightArmY"),
                     ],),),
                    //holf arm
                  Container(
                    margin: EdgeInsets.only(top: 130 ,left: MediaQuery.of(context).size.width*0.22,),
                    width: MediaQuery.of(context).size.width,
                    child :Row(children: [
                    btn(130, controlls["leftHalfArm"], controlls['leftHand'],"leftHalfArm","leftHand"),
                    SizedBox(width: 15,), 
                    btn(130, controlls["rightHalfArm"], controlls['rightHand'],"rightHalfArm","rightHand"),
                    ],)),
 
                ],
               ),
             ),
            ],
           ),
         ),
       ),
     );
   }
  }
