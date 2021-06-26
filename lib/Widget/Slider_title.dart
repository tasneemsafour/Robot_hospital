import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderTitle extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTitle({this.imageAssetPath, this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.6,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(200.0),
                      bottomRight: Radius.circular(150.0),
                      bottomLeft: Radius.circular(200.0),
                      topLeft: Radius.circular(150.0)),
                  //color: Colors.blue[300]
                  gradient: LinearGradient(colors: [
                    Colors.indigo[200],
                    Colors.blue[200],
                  ])),
              child: CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage(imageAssetPath),
                backgroundColor: Colors.blue[300],
              ),
            ),
          ),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[200]),
          ),
          SizedBox(
            height: 15,
          ),
          Text(desc,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w100,
                  color: Colors.grey)),
        ],
      ),
    );
  }
}
