import 'package:bloc/bloc.dart';

//events & states
enum LoginEvent { emailLogin, otpLogin, forgotPassword }
enum LoginState { loginUninitialized, loginLoading, loginSuccess, loginFailed }

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc(LoginState initialState) : super(LoginState.loginUninitialized);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    switch (event) {
      case LoginEvent.emailLogin:
        {
          yield LoginState.loginLoading;
          final loginState = await emailLogin();
          yield loginState;
          break;
        }

      case LoginEvent.otpLogin:
        {
          yield LoginState.loginLoading;
          break;
        }
    }
  }

  Future<LoginState> emailLogin() async {
    await Future.delayed(Duration(seconds: 3));
    return LoginState.loginSuccess;
  }

  otpLogin() {}

  forgotPassword() {}
}
