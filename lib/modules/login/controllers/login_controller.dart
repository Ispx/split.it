import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/login/interface/ilogin.dart';
import 'package:split_it/modules/login/models/login_state.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/login/services/login_service.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase extends ILogin with Store {
  @observable
  LoginState _state = LoginStateEmpity();
  LoginService? _service;
  _LoginControllerBase(this._service);
  LoginState get state => _state;

  @action
  Future<UserModel> googleSignIn() async {
    try {
      _state = LoginStateLoading();
      final userModel = await _service!.googleSignIn();
      _state = LoginStateSucess(userModel);
      await _registerUserInFirebase(userModel);
      return userModel;
    } catch (error) {
      _state = LoginStateFailure('Falha ao obter usuário da conta Google');
      throw 'Falha ao obter usuário da conta Google';
    }
  }

  _registerUserInFirebase(UserModel userModel) async {
    FirebaseFirestore.instance
        .collection('/users/')
        .doc(userModel.id)
        .set(userModel.toMap());
  }

  @action
  Future signInWithApple() async {
    try {
      _state = LoginStateLoading();
      final userModel = await _service!.signInWithApple();
      _state = LoginStateSucess(userModel);
      await _registerUserInFirebase(userModel);
      return userModel;
    } catch (error) {
      _state = LoginStateFailure(error.toString());
      throw error.toString();
    }
  }
}
