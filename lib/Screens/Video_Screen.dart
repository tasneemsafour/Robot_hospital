import 'package:flutter/material.dart';
import 'package:hospital_application/Screens/MainHome_Screen.dart';
import 'package:hospital_application/Screens/broadcast_page.dart';
import 'package:hospital_application/Widget/Animation.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  static String routName = '/VideoScreen';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _channelName = 'firstchannel';
  String check = '';
  /*
  void addTaskFunction(BuildContext context){
    // print(patient["patient"].id.toString() +
    //   "//" +
    //patient["category"].length.toString());
    Navigator.of(context).pushNamed(taskScreen.routName, arguments: {
      "id": patient.id,
    });
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.blue[300],
                    Colors.blue[200],
                    Colors.blue[100]
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1, Text("VideoCall", style: TextStyle(color: Colors.white, fontSize: 40),)),
                    SizedBox(height: 10,),
                    FadeAnimation(1.3, Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18),)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),
                          FadeAnimation(1.4, Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                          )),
                          SizedBox(height: 40,),
                          FadeAnimation(1.6, Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue[300]
                            ),
                            child: Center(
                              child:TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () => onJoin(isBroadcaster: true),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Make VideoCall   ',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              //child: Text("Make VideoCall", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          )),
                          SizedBox(height: 50,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: FadeAnimation(1.8, Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.red
                                  ),
                                  child: Center(
                                    child:TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () =>Navigator.of(context).pop(context),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Back ',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //child: Text("Back", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ),
                                )),
                              ),
                              SizedBox(width: 30,),
                              Expanded(
                                child: FadeAnimation(1.9, Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black
                                  ),
                                  child: Center(
                                      child:TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                        onPressed: () =>Navigator.of(context).pushNamed(CarouselDemoState.routName),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'HomePage ',
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    /*Scaffold(
        resizeToAvoidBottomInset: true,
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.2,
                child: TextFormField(
                  controller: _channelName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Channel Name',
                  ),
                ),
              ),*/
              /*TextButton(
                onPressed: () => onJoin(isBroadcaster: false),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Just Watch  ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      Icons.remove_red_eye,
                    )
                  ],
                ),
              ),*/
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () => onJoin(isBroadcaster: true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Broadcast    ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.live_tv)
                  ],
                ),
              ),
              Text(
                check,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ));*/
    }
  Future<void> onJoin({bool isBroadcaster}) async {
    await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
          channelName: _channelName,
          isBroadcaster: isBroadcaster,
        ),
      ),
    );
  }
}
