import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatefulWidget {
  const LoginSuccessScreen({Key key}) : super(key: key);

  @override
  _LoginSuccessScreenState createState() => _LoginSuccessScreenState();
  static String routName= 'LoginSuccessScreen';
}


class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(" Hello Doctor"),
    );
  }
}
