import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/login_api.dart';
import 'package:hospital_application/Screens/LoginSuccessScreen.dart';
import 'package:hospital_application/Screens/Slider_screen.dart';
import 'package:hospital_application/Screens/Speech_Screen.dart';
import 'package:hospital_application/Screens/Tasks_screen.dart';
import 'package:hospital_application/Screens/Video_Screen.dart';
import 'package:hospital_application/Screens/charging_screen.dart';
import 'package:hospital_application/Screens/foodScreen.dart';
import 'package:hospital_application/Screens/taskParameter.dart';
import './Screens/home-screen.dart';
import 'package:hospital_application/Screens/sign_up.dart';
import 'package:hospital_application/blocs/auth_bloc.dart';
import 'package:hospital_application/blocs/auth_state.dart';
import 'Screens/patientProfile_screen.dart';
import 'Screens/patients_screen.dart';
import 'Screens/medicineScreen.dart';
import 'Screens/before_mission.dart';
import 'Screens/MapScreen.dart';
import 'Screens/controll_screen.dart';
import './Screens/Controls/Joystick_screen.dart';
import './Screens/Controls/movementAction.dart';
import './Screens/Controls/setting_screen.dart';
import './Screens/MainHome_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(loginInitState(), Login_Api()))
        ],
        child: MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.blue[300],
              accentColor: Colors.blue[200],
            ),
            home: AnimatedSplashScreen(
              splash: ('assets/images/robpng.png'),
              backgroundColor: Colors.blue[200],
              nextScreen:slider(),
            ),
            debugShowCheckedModeBanner: false,
            routes: <String, WidgetBuilder>{
              slider.routName: (ctx) => slider(),
              taskScreen.routName: (ctx) => taskScreen(),
              LoginSuccessScreen.routName: (ctx) => LoginSuccessScreen(),
              sign_up.routName: (ctx) => sign_up(),
              PationtScreen.routName: (ctx) => PationtScreen(),
              PationtProfile_screen.routeName: (ctx) => PationtProfile_screen(),
              taskParameter.routName: (ctx) => taskParameter(),
              foodScreen.routName: (ctx) => foodScreen(),
              medicineScreen.routName: (ctx) => medicineScreen(),
              chargingScreen.routName: (ctx) => chargingScreen(),
              sort_TaskScreen.routName: (ctx) => sort_TaskScreen(),
              Home_screen.routName: (ctx) => Home_screen(),
              MapScreen.routName: (ctx) => MapScreen(),
              controll_screen.routName: (ctx) => controll_screen(),
              Joystick_screen.routeName:(ctx)=>Joystick_screen(),
              Setting_Screen.routeName:(ctx)=>Setting_Screen(),
              MovementAction.routName:(ctx)=>MovementAction(),
              HomePage.routName:(ctx)=>HomePage(),
              MyHomePage.routName:(ctx)=>MyHomePage(),
              CarouselDemoState.routName:(ctx)=>Home_screen(),
            }));
  }
}