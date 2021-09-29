import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/login_api.dart';
import 'package:hospital_application/Models/token.dart';
import 'package:hospital_application/Screens/MainHome_Screen.dart';
import 'package:hospital_application/Screens/home-screen.dart';
import 'package:hospital_application/Widget/Animation.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';
import 'package:hospital_application/appid.dart';
import 'package:hospital_application/blocs/auth_bloc.dart';
import 'package:hospital_application/blocs/auth_events.dart';
import 'package:hospital_application/blocs/auth_state.dart';
import 'package:hospital_application/Screens/addUrl.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key key}) : super(key: key);
  @override
  _sign_upState createState() => _sign_upState();
  static String routName = 'sign_up';
}

class _sign_upState extends State<sign_up> {
  bool signupbool = true;

  TextEditingController usernameControll = TextEditingController();
  TextEditingController passcontroll = TextEditingController();

  AuthBloc authbloc;
  @override
  void initState() {
    authbloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  final msgError = BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      if (state is LoginErrorState) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            child: Text(
              state.msg,
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      } else if (state is loginLodingState) {
        return Container(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ));
      } else if (state is DoctorLoginSuccState) {
        Navigator.of(context).pushReplacementNamed(CarouselDemoState.routName);
      } else {
        return Container(
          height: 30,
        );
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is DoctorLoginSuccState) {
            return Navigator.of(context).pushNamed(
              Home_screen.routName,
            );
          } else if (state is NurseLoginSuccState) {
            return null;
          }
        },
        child: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background3.jpg'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: Colors.blue[200],
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue[100],
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[100]))),
                            child: TextField(
                              controller: usernameControll,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "User name",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: passcontroll,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(
                    //height: 30,
                    //),
                    msgError,
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        //width: MediaQuery.of(context).size.width*0.85,
                        child: gradient_button("login"),
                        onTap: () {
                          print(tokenAPI.url);
                          authbloc.add(loginButtonPessed(
                              username: usernameControll.text,
                              password: passcontroll.text));
                          //Navigator.pushNamed(context, 'CarouselDemoState');
                          /* Navigator.of(context)
                              .pushReplacementNamed(CarouselDemoState.routName);
                              */
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(addUrl.routName);
                      },
                      child: const Text('Forget IP'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
