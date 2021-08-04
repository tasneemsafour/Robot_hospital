import 'package:flutter/material.dart';
class reportImage extends StatelessWidget {
  const reportImage({ Key  key }) : super(key: key);
  static const routeName = '/reportImage ';
  @override
  Widget build(BuildContext context) {
    String img  = ModalRoute.of(context).settings.arguments as String ;
    return Container(
     // child: AssetImage(img , ),
    );
  }
}