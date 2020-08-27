import 'package:Practise_flutter/user.dart';
import 'package:Practise_flutter/utils/state.dart';
import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<EventState> {
  LoginCubit(EventState state) : super(state);

  User user;

  emailLogin(String email, String password) async {
    emit(Progress());
    getUserFromRepo().then((user) {
      //success
      this.user = user;
      emit(Success(user));
    }).catchError((error) {
      //error
      emit(Error(error));
    });
  }

  Future<User> getUserFromRepo() async {
    //mimicing API latency
    await Future.delayed(Duration(seconds: 3));
    //throw Exception("401: User not found");
    return User("Rishab");
  }
}
