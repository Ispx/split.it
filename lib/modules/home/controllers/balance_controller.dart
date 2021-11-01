import 'package:flutter/cupertino.dart';
import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'package:split_it/modules/home/states/balance_states.dart';

class BalanceController {
  IHomeRepository _repository;
  VoidCallback? onUpdate;
  BalanceState _state = BalanceStateEmpity();

  BalanceController(this._repository, {this.onUpdate});
  BalanceState get state => _state;
  void _changeState(BalanceState state) {
    this._state = state;
    this.onUpdate!();
  }

  Future<BalanceModel> getBalance() async {
    _changeState(BalanceStateLoading());
    try {
      final balance = await _repository.getBalance();
      _changeState(BalanceStateDone(balance));
      return (_state as BalanceStateDone).balance;
    } catch (e) {
      _changeState(BalanceStateError('Falha durante requisição do balance'));
      throw (_state as BalanceStateError).message;
    }
  }
}
