import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/login_api.dart';
import 'package:hospital_application/Models/SliderModel.dart';
import 'package:hospital_application/Screens/sign_up.dart';
import 'package:hospital_application/Widget/Slider_title.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';
import 'package:hospital_application/blocs/auth_bloc.dart';
import 'package:hospital_application/blocs/auth_state.dart';

class slider extends StatefulWidget {
  const slider({Key key}) : super(key: key);

  @override
  _sliderState createState() => _sliderState();
  static String routName = 'Slider_Screen';
}

class _sliderState extends State<slider> {
  List<SliderModel> slides = new List<SliderModel>();
  int CurrentIndex = 0;
  @override
  void initState() {
    super.initState();
    slides = getSliders();
  }

  //Next Screen
  void _nextScreen(BuildContext cont) {
    Navigator.of(cont).pushReplacementNamed(sign_up.routName);
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(15)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: slides.length,
                onPageChanged: (val) {
                  setState(() {
                    CurrentIndex = val;
                  });
                },
                itemBuilder: (context, index) {
                  return SliderTitle(
                    imageAssetPath: slides[index].getImageAssertPath(),
                    title: slides[index].getTitle(),
                    desc: slides[index].getDosc(),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < slides.length; i++)
                  CurrentIndex == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            width: double.infinity,
            child: GestureDetector(
              child: gradient_button(
                  CurrentIndex == slides.length - 1 ? "GET START" : "SKIP"),
              onTap: () {
                _nextScreen(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
