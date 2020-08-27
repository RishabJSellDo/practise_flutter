import 'package:Practise_flutter/utils/state.dart';
import 'package:bloc/bloc.dart';

import 'login_event.dart';

//events & states

class LoginBloc extends Bloc<LoginEvent, EventState> {
  LoginBloc(EventState initialState) : super(Default());

  @override
  Stream<EventState> mapEventToState(LoginEvent event) async* {
    if (event is EmailLogin) {
      //email login
      yield Progress();
      final loginState = await emailLogin();
      yield loginState;
    } else if (event is OtpLogin) {
      //otp login

      yield Progress();
    } else if(event is ForgotPassword) {
      //forgot password


    }
  }

  Future<EventState> emailLogin() async {
    //mimicing the login
    await Future.delayed(Duration(seconds: 3));
    final token = "Access Token";
    //return LoggedIn(token);
    return Error(Exception("Login Failed"));
  }

  otpLogin() {}

  forgotPassword() {}
}
