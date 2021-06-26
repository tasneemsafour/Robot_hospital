//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/charging_screen.dart';
import 'package:hospital_application/Screens/patients_screen.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:hospital_application/Screens/controll_screen.dart';
import 'package:hospital_application/Screens/MapScreen.dart';

class GridDashboard extends StatelessWidget {
  //--------------------------------------------------------------------------
  void selectCategory(BuildContext context, int action) {
    if (action == 1) {
      Navigator.of(context).pushNamed(PationtScreen.routName);
    }
    if (action == 2) {
      //Navigator.push(context,new MaterialPageRoute(builder: (context) => new SecondScreen()),);
    }
    if (action == 3) {
      Navigator.of(context).pushNamed(MapScreen.routName);
    }
    if (action == 4) {
      //Not implement yet
    }
    if (action == 5) {
      Navigator.of(context).pushNamed(controll_screen.routName);
      //Not implement yet
    }
    if (action == 6) {
      Navigator.of(context).pushNamed(chargingScreen.routName);
      //Not implement yet
    }
  }

  Widget getItem(Items item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 170.0,
        width: (MediaQuery.of(context).size.width / 2) - 30.0,
        child: InkWell(
          onTap: () => selectCategory(context, item.action),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.indigo[200],
                Colors.blue[200],
              ]),
              //color: Colors.blue[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(item.img, width: 42),
                SizedBox(height: 14),
                Text(
                  item.title,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.subtitle,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  item.event,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //boxes in screen
  Items item1 = new Items(
      title: "Follow Up",
      subtitle: "Patient, Tesks",
      event: "",
      img: "assets/images/todo.png",
      action: 1);
  Items item2 = new Items(
      title: "Voice",
      subtitle: "Celling robot",
      event: " ",
      img: "assets/images/voice.jpg",
      action: 2);
  Items item3 = new Items(
      title: "Locations",
      subtitle: "Robot going to somewhere",
      event: "",
      img: "assets/images/map.jpg",
      action: 3);
  Items item4 = new Items(
      title: "VideoCell",
      subtitle: "",
      event: "",
      img: "assets/images/video.jpg",
      action: 4);
  Items item5 = new Items(
      title: "Motion",
      subtitle: "control Move of robot",
      event: " ",
      img: "assets/images/robpngg.png",
      action: 5);
  Items item6 = new Items(
      title: "Charging",
      subtitle: "",
      event: "2 Items",
      img: "assets/images/charging.png",
      action: 6);
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    // var color = Colors.blue[400];
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                getItem(item1, context),
                getItem(item3, context),
                getItem(item5, context),

                // getshampoCard('assets/h.png', 'Heads &shoulder ', '75',Colors.indigo[900],),
                //getshampoCard('assets/p.png', 'Pantine', '30',Colors.purple[300]),
                //getshampoCard('assets/v.png', 'Vatika', '25',Colors.blue[100]),
                SizedBox(height: 15.0)
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 45.0),
                getItem(item2, context),
                getItem(item4, context),
                getItem(item6, context),
                //getshampoCard('assets/e.png', 'Elvive', '60 ',Colors.pink[300]),
                //getshampoCard('assets/dove.png', 'Sun Block dove', '25',Colors.lightGreenAccent[400]),
                //getshampoCard('assets/d.png', 'Dove Woman', '100',Colors.yellowAccent[700]),
              ],
            )
          ],
        )
      ],
    );

    /*
    Flexible(
      child: GridView.count(
      
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 20,
        children: myList.map((data) {
          return InkWell(
            
            onTap: () => selectCategory(context, data.action),
            child: Container(
             // height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.indigo[200],
                  Colors.blue[200],
                ]),
                //color: Colors.blue[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(data.img, width: 42),
                  SizedBox(height: 14),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );*/
  }
}

//---------------------------------------------------------------------------------
class Items {
  String title;
  String subtitle;
  String event;
  String img;
  int action;
  Items({this.title, this.subtitle, this.event, this.img, this.action});
}
