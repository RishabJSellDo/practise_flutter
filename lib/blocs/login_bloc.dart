import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

//events & states

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(LoginUninitialized());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailLogin) {
      //email login
      yield LoginLoading();
      final loginState = await emailLogin();
      yield loginState;
    } else if (event is OtpLogin) {
      //otp login
      yield LoginLoading();
    }
  }

  Future<LoginState> emailLogin() async {
    //mimicing the login
    await Future.delayed(Duration(seconds: 3));
    final token = "Access Token";
    return LoginFailure(Exception("Login Failed"));
  }

  otpLogin() {}

  forgotPassword() {}
}
