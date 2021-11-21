import 'package:flutter/material.dart';
import 'package:hospital_application/Models/home_item.dart';
import 'package:hospital_application/Screens/RecordsCREEN.dart';
import '../Models/home_item.dart';
import 'package:hospital_application/Screens/Speech_Screen.dart';
import 'package:hospital_application/Screens/Video_Screen.dart';
import 'package:hospital_application/Screens/charging_screen.dart';
import 'package:hospital_application/Screens/patients_screen.dart';
import 'package:hospital_application/Screens/Controls/Joystick_screen.dart';
import 'package:hospital_application/Screens/MapScreen.dart';

class homeItem extends StatelessWidget {
   final HomeItem item ; 
   homeItem(this.item);
   void selectedItem(BuildContext context, int action) {
    if (action == 1) {
      Navigator.of(context).pushNamed(PationtScreen.routName);
    }
    if (action == 2) {
      Navigator.of(context).pushNamed(HomePage.routName);
    }
    if (action == 3) {
      Navigator.of(context).pushNamed(mapScreen.routName);
    }
    if (action == 4) {
      Navigator.of(context).pushNamed(MyHomePage.routName);
    }
    if (action == 5) {
      Navigator.of(context).pushNamed(Joystick_screen.routeName);
      //Not implement yet
    }
    if (action == 6) {
      Navigator.of(context).pushNamed(chargingScreen.routName);
      //Not implement yet
    }
    if (action == 7) {
      Navigator.of(context).pushNamed(Record.routName);
      //Not implement yet
    }
  }
  
  @override
    Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectedItem(context, item.action),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      
          child: Stack (
            children :<Widget>[
               Container(
                 padding: EdgeInsets.only(top: 60),
                 height: MediaQuery.of(context).size.height*0.65,
                 //color: Colors.deepOrange,
                 child: ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(20))
                       ,
                       child:Image.asset(item.img,fit: BoxFit.fill,
                       ),
                     ),
               ),
                Container(
                  width: MediaQuery.of(context).size.width,
                   padding: const EdgeInsets.only(top :30.0,bottom: 30),
                   child: Text( item.title ,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Theme.of(context).accentColor,
                     fontSize: 18,
                   )
                   ),
                 ),
                 ], 
                ),
        ),
      );
  }
}