import 'package:flutter/widgets.dart';

abstract class LoginState  {
}

class LoginLoading extends LoginState {
}

//login success
class LoggedIn extends LoginState {
  final String token;
  LoggedIn(this.token) : super();
}

//login failure
class LoginFailure extends LoginState {
  Exception error;
  LoginFailure(this.error);
}

class LoginUninitialized extends LoginState {

}