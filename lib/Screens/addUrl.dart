import 'package:flutter/material.dart';
import 'package:hospital_application/Models/token.dart';
import 'package:hospital_application/Screens/sign_up.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';

class addUrl extends StatefulWidget {
  //const addUrl({ Key? key }) : super(key: key);

  @override
  _addUrlState createState() => _addUrlState();
  static String routName = 'addUrl';
}

TextEditingController urlcontrol = TextEditingController();

class _addUrlState extends State<addUrl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Add Url", style: TextStyle(color: Colors.white)),
              backgroundColor: Theme.of(context).accentColor,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: urlcontrol,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: " URL ",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: GestureDetector(
                    //width: MediaQuery.of(context).size.width*0.85,
                    child: gradient_button(" Save url "),
                    onTap: () {
                      tokenAPI.addurl(urlcontrol.text);
                      print(tokenAPI.url);
                      Navigator.of(context)
                          .pushReplacementNamed(sign_up.routName);
                    },
                  ),
                ),
              ],
            )));
  }
}
