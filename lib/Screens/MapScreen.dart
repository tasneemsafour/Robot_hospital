/*import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:hospital_application/API/speech_api.dart';
import 'package:hospital_application/Data/maplist.dart';
import 'package:hospital_application/utils.dart';



class mapScreen extends StatefulWidget {


  int index =0;
  String text=" ";
  String dis=" ";
  mapScreen({Key key, this.dis,this.index})
      : super(key: key);
  static String routName = 'mapScreen';
  @override
  _mapScreenState createState() => _mapScreenState();
}
class _mapScreenState extends State<mapScreen> {
   bool isListening = false;
   int _pos = 0;
   Timer _timer;
   TextEditingController controllerText = TextEditingController();
   AvatarGlow _avatarGlow;



  @override
  void initState() {
    //checkText();
    editpostion(widget.index);
    print(widget.text + "ttttttttttttttttttttttttttttttttt");
    super.initState();
  }
  editpostion(int index) {
    setState(() {
      _pos=  Rooms.elementAt(index).getImageName() *10;
      print(_pos.toString()+"tasneeeemmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        automaticallyImplyLeading: true,
        leading:  Icon(Icons.gps_fixed),
        title: Text("Recibtion"),
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[100],
          leading:  Icon(Icons.location_on),
          title: Text(_pos==0?" your destination":widget.text),),
          body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children:[
                  Container(
                    height: 500,
                    child :_pos==0 ? Image(image:AssetImage('assets/images/$_pos.jpg'), fit: BoxFit.fill, ):  Image(image:AssetImage('assets/images/$_pos.png'), fit: BoxFit.fill, ),
                  ),
                  SizedBox(width: 100,),
                  Column(
                    children:_pos==0?new List.generate(1, (ind) => new Container(
                      height: 50,
                      child : Text("Ready To Go",style: TextStyle(fontSize: 25),),
                    )):new List.generate(Rooms.elementAt(widget.index).step, (ind) => new Container(
                      height: 50,
                      child : Text(Rooms.elementAt(widget.index).details[ind],style: TextStyle(fontSize: 25),),
                    )),
                  ),

                ],
              ),
              SizedBox(height: 30,),
              /*ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[100], // background
                  onPrimary: Colors.white, // foreground
                ),
                label: Text("Your distination",style: TextStyle(fontSize: 20),),
                icon: Icon(Icons.location_on),
                onPressed:toggleRecording,
              )
               */
              AvatarGlow(
                animate: this.isListening,
                endRadius: 75,
                glowColor: Theme.of(context).primaryColor,
                child: FloatingActionButton(
                  child: Icon(this.isListening ? Icons.mic : Icons.mic_none, size: 36),
                  onPressed: toggleRecording,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   Future toggleRecording() => SpeechApi.toggleRecording(
     onResult: (text) => setState(() => widget.text = text),
     onListening: (isListening) {
       setState(() => this.isListening = isListening);

       if (!isListening) {
         Future.delayed(Duration(seconds: 1), () {
           Utils.scanText(widget.text);
           print(widget.text.toString());
         });
       }
     },
   );
}
*/
import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hospital_application/API/speech_api.dart';
import 'package:hospital_application/ConfigServer.dart';
import 'package:hospital_application/Data/maplist.dart';
import 'package:hospital_application/Widget/substring_highlighted.dart';
import 'package:hospital_application/utils.dart';
import 'package:http/http.dart' as http;
import "package:dart_amqp/dart_amqp.dart";

class mapScreen extends StatefulWidget {
  int index = 0;
  String dis = " ";
  String Text = " ";

  mapScreen({Key key, this.Text, this.index}) : super(key: key);
  static String routName = 'mapScreen';
  @override
  mapScreenState createState() => mapScreenState();
}

class mapScreenState extends State<mapScreen> {
  bool isListening = false;
  int _pos = 0;
  String defultText=" ";
  Timer _timer;
  String valueChoose;
  TextEditingController controllerText = TextEditingController();
  AvatarGlow _avatarGlow;

  @override
  void initState() {
    //checkText();
    widget.dis= widget.Text;
    editpostion(widget.index);
    print(widget.dis + "ttttttttttttttttttttttttttttttttt");
    super.initState();
  }

  editpostion(int index) {
    setState(() {
      _pos = Rooms.elementAt(index).getImageName() * 10;
      print(_pos.toString() + "tasneeeemmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text("Map"),

      ),
      body:Container(
            color:Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //reverse: true,
            //padding: const EdgeInsets.all(30).copyWith(bottom: 150),
            child: Stack(children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.width/20,
                child: DropdownButtonFormField<String>(

                  hint: Text("Your Distination"),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  dropdownColor: Colors.white,
                  //icon: Icon(Icons.location_on),
                  iconSize: 36,
                  isExpanded: true,
                  // underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 22),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue.toString();
                      widget.dis= newValue.toString();
                      for(int i=0 ; i<Rooms.length+2 ;i++)
                        {
                          if (Rooms[i].name[0] == newValue.toString())
                            {
                              widget.index =  Rooms[i].ImageName;
                              _pos = Rooms[i].ImageName * 10;

                              print(_pos.toString() + "pppppppppppppppppppppppppppppppppp");
                              break;
                            }
                        }
                      }
                    );
                  },
                  items: Rooms.map((valItem) {
                    return DropdownMenuItem(
                        child: Text(valItem.name[0].toString()),
                        value: valItem.name[0].toString(),

                    );
                  }).toList(),
                ),
              ),
              Positioned(
                top: 70,
                left: 10,
                bottom: 10,
                right: (MediaQuery.of(context).size.width/2)-150,
                child: Container(
                  height: 500,
                  child: _pos == 0
                      ? Image(
                          image: AssetImage('assets/images/$_pos.jpg'),
                          fit: BoxFit.fill,
                        )
                      : Image(
                          image: AssetImage('assets/images/$_pos.png'),
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Positioned(
                top: 150,
                right: 200,
                child: Column(
                  children: _pos == 0
                      ? new List.generate(
                          1,
                          (ind) => new Container(
                                height: 50,
                                child: Text(
                                  "Ready To Go",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ))
                      : new List.generate(
                          Rooms.elementAt(widget.index).step,
                          (ind) => new Container(
                                height: 50,
                                child: Text(
                                  Rooms.elementAt(widget.index).details[ind],
                                  style: TextStyle(fontSize: 25),
                                ),
                              )),
                ),
              ),
              Positioned(
                  bottom: 100,
                  right: 200,
                  child: AvatarGlow(
                    animate: isListening,
                    endRadius: 75,
                    glowColor: Colors.white,
                    child: FloatingActionButton(
                      child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
                      onPressed: toggleRecording,
                    ),
                  ),
              ),
      Positioned(
        bottom: 50,
        right: 200,
        child:Text(
            this.defultText,
        ),
      )
            ])),
  );
  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (defultText) => setState(() => this.defultText= defultText ),
      onListening: (isListening) {
        setState(() => this.isListening = isListening);
        if (!isListening) {
          print("tasneeeeeeeeeeeeeeeeeeeem");
          Timer(Duration(seconds: 1), () async {
            Utils.scanText(this.defultText);
            print(this.defultText + "teeeextttttttttttttttttttttt");
            setState(() {
              widget.dis= this.defultText;
            });
            for (int i = 0; i < Rooms.length; i++) {
              for (int j = 0; j < Rooms[i].name.length; j++) {
                if (widget.dis.contains(Rooms[i].name[j])) //true
                {
                  String s = Rooms[i].name[j];
                  print("----------------------------------------------------------------------------------");
                  print("the destination is $widget.dis");
                  widget.index =  Rooms[i].ImageName;
                  //int index = i;
                  //print("the index of the $widget.");
                  setState(() {
                    _pos = Rooms[widget.index].ImageName * 10;
                    widget.dis = s;
                  });
                }
              }
            }
          });
        } else {
          print("hhhhhhhhhhhhhhhhhhhhhhh");
        }
      });
}
