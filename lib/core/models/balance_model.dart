import 'package:flutter/foundation.dart';
import 'package:split_it/modules/home/components/indicator_operation_balance.dart';

class BalanceModel {
  final double? amountRecived;
  final double? amountToPay;
  BalanceModel({
    @required this.amountRecived,
    @required this.amountToPay,
  });
}
