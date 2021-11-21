import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:hospital_application/API/speech_api.dart';
import 'package:hospital_application/ConfigServer.dart';
import 'package:hospital_application/Data/maplist.dart';
import 'package:hospital_application/Screens/MapScreen.dart';
import 'package:hospital_application/Widget/substring_highlighted.dart';
import 'package:hospital_application/utils.dart';
import 'package:http/http.dart' as http;
import "package:dart_amqp/dart_amqp.dart";

class HomePage extends StatefulWidget {
  static String routName = '/SpeechScreen';
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String text = 'Press the button and start speaking';
  bool isListening = false;
  AvatarGlow _avatarGlow;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Speech"),
      centerTitle:   true,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.content_copy),
            onPressed: () async {
              await FlutterClipboard.copy(text);

              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('✓   Copied to Clipboard')),
              );
            },
          ),
        ),
      ],
    ),
    body: Container(
        color: Colors.blue[200],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //reverse: true,
        //padding: const EdgeInsets.all(30).copyWith(bottom: 150),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child:Container(color:Colors.blue[200],height:100,width:100,child: Image.asset('assets/images/1.png',fit: BoxFit.fill))),
              Positioned(
                  top: 0,
                  right: 0,
                  child:Container(color:Colors.blue[200],height:100,width:100,child: Image.asset('assets/images/2.png',fit: BoxFit.fill))),
              Positioned(
                  bottom:0,
                  left:0,
                  child:Container(color:Colors.blue[200],height:100,width:100,child: Image.asset('assets/images/33.png',fit: BoxFit.fill))),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child:Container(color:Colors.blue[200],height:100,width:100,child: Image.asset('assets/images/4.png',fit: BoxFit.fill))),
              Positioned(
                top: 100,
                right: 100,
                left: 100,
                bottom: 100,
                child: SubstringHighlight(
                  text: text,
                  terms: Command.all,
                  textStyle: TextStyle(
                    fontSize: 100.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  textStyleHighlight: TextStyle(
                    fontSize: 32.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ]
        )
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: _avatarGlow = AvatarGlow(
      animate: isListening,
      endRadius: 75,
      glowColor: Theme.of(context).primaryColor,
      child: FloatingActionButton(
        child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
        onPressed: toggleRecording,
      ),
    ),
  );
  void ReceiveNotificationFromRabitMQ() async{
    Client client = Client( settings: new ConnectionSettings(
        host: ConfigServer.IP,
        port: 5672
    ) );
    Channel channel = await client.channel(); // auto-connect to localhost:5672 using guest credentials
    Queue queue = await channel.queue("notification");
    Consumer consumer = await queue.consume();
    consumer.listen((AmqpMessage message) {
      // Get the payload as a string
      print(" [x] Received string: ${message.payloadAsString}");
      print(message.payloadAsJson['Act']);
      if (int.parse(message.payloadAsJson['Act']) == 1) {
        toggleRecording();
        print('OOOOOOOOOOKKKKKKKKKK');
      }
      // Or unserialize to json
      //print(" [x] Received json: ${message.payloadAsJson}");

      // Or just get the raw data as a Uint8List
      //print(" [x] Received raw: ${message.payload}");

      // The message object contains helper methods for
      // replying, ack-ing and rejecting
    });
  }
  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) =>
          setState(() => this.text = text),
      onListening: (isListening) {

        setState(() => this.isListening = isListening);
        if (!isListening) {
          print("tasneeeeeeeeeeeeeeeeeeeem");
          Timer(Duration(seconds: 1), () async {
            Utils.scanText(text);
            Map<String, String> dictToSend = {'Task': text};
            String url = "http://" + ConfigServer.IP + ":" + ConfigServer.Port + "/";
            Map<String, String> Dict =  {};
            if(text.compareTo("ايوه") == 0 || text.compareTo("اه") == 0 || text.compareTo("نعم") == 0 ||
                text.compareTo("لا") == 0 || text.compareTo("تمام") == 0 ||
                text.compareTo("شكرا") == 0 || text.compareTo("ماشي") == 0 || text.compareTo("ليه") == 0 ) {
              //words '            url += "SendMsg/";
              Dict = {"msg": text};
            }
            else {
              String distination;
                print(text+ "teeeextttttttttttttttttttttt");
                for (int i =0 ; i<Rooms.length ; i++)
                {
                  for(int j=0 ; j<Rooms[i].name.length ; j++)
                  {

                    if(text.contains(Rooms[i].name[j])) //true
                        {
                      distination = Rooms[i].name[j];
                      print("----------------------------------------------------------------------------------");
                      print("the destination is $distination");
                     int  index = i;
                      print("the index of the $index");
                      Navigator.of(context).push(
                          MaterialPageRoute(
                          builder: (context) => mapScreen(
                            Text : distination,
                             index :index ,
                      ),) ,);


                  }
                }
              }
              /*if(text.compareTo("عايز اروح") == 0 || text.compareTo("وديني") == 0 || text.contains("قاعة ") ||
                  text.compareTo("مكان") == 0 || text.contains("مؤتمرات"))
                 {
                   print ("textttttttt" + text) ;
                    Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => mapScreen(
                       text1 : text
                       ),
                     ),
                   );
                 }*/
             }
            var re = await http.post(
                Uri.parse(url),
                body: Dict,
                headers: {});
            //if (url.contains('SendMsg')) return;
            //else ReceiveFromRabitMQ();
            print("${re.statusCode}");
            print("${re.body}");
          });
          ReceiveNotificationFromRabitMQ();
        }
        else
        {
          print ("hhhhhhhhhhhhhhhhhhhhhhh");

        }
      }
  );

}