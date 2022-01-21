import 'package:mobx/mobx.dart';
import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'package:split_it/modules/home/states/balance_states.dart';

part 'balance_controller.g.dart';

class BalanceController = _BalanceControllerBase with _$BalanceController;

abstract class _BalanceControllerBase with Store {
  IHomeRepository? _repository;
  @observable
  BalanceState _state = BalanceStateEmpity();
  _BalanceControllerBase(this._repository);
  BalanceState get state => _state;
  void _changeState(BalanceState state) {
    this._state = state;
  }

  @action
  Future<BalanceModel> getBalance() async {
    _changeState(BalanceStateLoading());
    try {
      final balance = await _repository!.getBalance();
      _changeState(BalanceStateDone(balance));
      return (_state as BalanceStateDone).balance;
    } catch (e) {
      _changeState(BalanceStateError('Falha durante requisição do balance'));
      throw (_state as BalanceStateError).message;
    }
  }
}
