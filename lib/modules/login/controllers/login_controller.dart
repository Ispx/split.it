import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/interface/ilogin.dart';
import 'package:split_it/modules/login/models/login_state.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/login/services/login_service.dart';

class LoginController extends ILogin {
  Function(LoginState state)? onChange;
  LoginState _state = LoginStateEmpity();
  LoginService _service;
  VoidCallback onUpdate;
  LoginController(this.onUpdate, this._service);
  LoginState get state => _state;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  void onListen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(_state);
    }
  }

  Future<UserModel> googleSignIn() async {
    try {
      _state = LoginStateLoading();
      update();
      final userModel = await _service.googleSignIn();
      _state = LoginStateSucess(userModel);
      update();
      return userModel;
    } catch (error) {
      _state = LoginStateFailure('Falha ao obter usuário da conta Google');
      update();
      throw 'Falha ao obter usuário da conta Google';
    }
  }
}
