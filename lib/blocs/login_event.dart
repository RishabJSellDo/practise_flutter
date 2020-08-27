abstract class LoginEvent {}

class EmailLogin extends LoginEvent {
  String email;
  String password;

  EmailLogin(this.email, this.password);
}

class OtpLogin extends LoginEvent {
  String mobileNo;

  OtpLogin(this.mobileNo);
}

class ForgotPassword extends LoginEvent {
  String email;

  ForgotPassword(email);
}
