import 'package:split_it/core/models/balance_model.dart';
import 'package:split_it/modules/event/models/event_model.dart';

abstract class BalanceState {}

class BalanceStateEmpity implements BalanceState {}

class BalanceStateLoading implements BalanceState {}

class BalanceStateError implements BalanceState {
  String message;
  BalanceStateError(this.message);
}

class BalanceStateDone implements BalanceState {
  BalanceModel balance;
  BalanceStateDone(this.balance);
}
