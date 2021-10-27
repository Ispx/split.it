import 'package:split_it/core/models/user_model.dart';

abstract class LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateEmpity extends LoginState {}

class LoginStateFailure extends LoginState {
  final String message;
  LoginStateFailure(this.message);
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}

class LoginStateSucess extends LoginState {
  UserModel user;
  LoginStateSucess(this.user);
}
