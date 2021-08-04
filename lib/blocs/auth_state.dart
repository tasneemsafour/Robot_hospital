// when succ oe wrong process after event

import 'package:equatable/equatable.dart';

class AuthState extends Equatable{
  @override
  List<Object> get props=>[];

}
class loginInitState extends AuthState {}

class loginLodingState extends AuthState {}

class DoctorLoginSuccState extends AuthState {}
class NurseLoginSuccState extends AuthState {}

class LoginErrorState extends AuthState {
  final  String msg ;
  LoginErrorState({this.msg}) ;
}
