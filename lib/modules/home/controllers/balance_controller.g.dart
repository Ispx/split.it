// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceController on _BalanceControllerBase, Store {
  final _$_stateAtom = Atom(name: '_BalanceControllerBase._state');

  @override
  BalanceState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(BalanceState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$getBalanceAsyncAction =
      AsyncAction('_BalanceControllerBase.getBalance');

  @override
  Future<BalanceModel> getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
