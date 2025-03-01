import 'package:Practise_flutter/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static final id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final primary_color = Color(0xFF0176FF);
  LoginBloc _loginBloc = LoginBloc(LoginState.loginUninitialized);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              child: Stack(
                children: [

                  //artwork & logo
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: primary_color,

                    //column of logo and artwork
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //logo
                        SvgPicture.asset(
                          'assets/images/logo_with_text.svg',
                          height: 48,
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ),

                        //artwork
                        SvgPicture.asset(
                          'assets/images/mountain.svg',
                          fit: BoxFit.cover,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),

                  //input user login credentials here
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(16, 12, 16, 36),
                      padding: EdgeInsets.symmetric(
                          vertical: 36, horizontal: 24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //title for input of email credentials
                          Text('Please enter your email ID & password'),

                          //enter email
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(labelText: 'Email'),
                            ),
                          ),

                          //enter password
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  labelText: 'Password'),
                            ),
                          ),

                          //sign-in button
                          Container(
                              margin: EdgeInsets.only(top: 24),
                              child: BlocBuilder<LoginBloc, LoginState>(
                                  cubit: _loginBloc,
                                  // ignore: missing_return
                                  builder: (BuildContext context,
                                      LoginState state,) {
                                    switch (state) {
                                      case LoginState.loginUninitialized:
                                        return loginButton();

                                    //progress
                                      case LoginState.loginLoading:
                                        return loginLoader();

                                    //success
                                      case LoginState.loginSuccess:
                                        return loginButton();

                                    //error
                                      case LoginState.loginFailed:
                                        return loginButton();
                                    }
                                  })),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  Widget loginButton() {
    return RaisedButton(
      color: primary_color,
      elevation: 4,
      onPressed: () {
        _loginBloc.add(LoginEvent.emailLogin);
      },
      child: Text(
        'Sign in',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget loginLoader() {
    return SizedBox.fromSize(
      size: Size(40, 40),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}
