import 'package:mobx/mobx.dart';
import 'package:split_it/modules/login/interface/ilogin_repository.dart';
import 'package:split_it/modules/login/models/login_state.dart';

import '../../../core/models/user_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  UserModel? _userModel;
  @observable
  LoginState _state = LoginStateEmpity();
  ILoginRepository _repository;
  _LoginControllerBase(this._repository) ;
  LoginState get state => _state;
  UserModel? get authModel => _userModel;
  @action
  Future<UserModel> signIn() async {
    try {
      _state = LoginStateLoading();
      _userModel = await _repository.signIn();
      _state = LoginStateSucess(authModel!);
      return authModel!;
    } catch (error) {
      _state = LoginStateFailure('Falha ao obter usuário da conta Google');
      throw 'Falha ao obter usuário da conta Google';
    }
  }

  Future signOut() async {
    await _repository.signOut();
  }
}
