import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/models/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginController {
  VoidCallback onUpdate;
  LoginState _state = LoginStateEmpity();
  LoginController(this.onUpdate);
  LoginState get state => _state;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  Future<void> googleSignIn() async {
    try {
      _state = LoginStateLoading();
      onUpdate();
      var signInAccount = await _googleSignIn.signIn();
      final userModel = UserModel.google(signInAccount!);
      _state = LoginStateSucess(userModel);
      onUpdate();
    } catch (error) {
      _state = LoginStateFailure('Falha ao obter usuário da conta Google');
      onUpdate();
      throw 'Falha ao obter usuário da conta Google';
    }
  }
}
