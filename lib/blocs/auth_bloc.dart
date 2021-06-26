import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/login_api.dart';
import 'package:hospital_application/blocs/auth_events.dart';
import 'package:hospital_application/blocs/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import'package:hospital_application/Models/token.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Login_Api log;
  AuthBloc(AuthState initialState, this.log) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield loginInitState();
    } else if (event is loginButtonPessed) {
      yield loginLodingState();
      var data = await log.login(event.username, event.password);
      print(data);
      if (data["token"] == null) {
        yield LoginErrorState(msg: "Invalid Username or Password");
      } else {
        pref.setString("token", data["token"]);
        token.addtoken(data['token']);
        yield DoctorLoginSuccState();
      }
    } else {
      yield LoginErrorState();
    }
  }
}
