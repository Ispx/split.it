// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$_stateAtom = Atom(name: '_LoginControllerBase._state');

  @override
  LoginState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(LoginState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_LoginControllerBase.signIn');

  @override
  Future<UserModel> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
