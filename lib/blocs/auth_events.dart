import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable{
  @override
  List<Object> get props=>[];

}
class StartEvent extends AuthEvent
{}

class loginButtonPessed extends AuthEvent{
  String username;
  String password;

  loginButtonPessed({
    this.username,
    this.password,
  });
}