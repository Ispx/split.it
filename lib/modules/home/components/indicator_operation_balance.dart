import 'package:flutter/material.dart';
import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/core/theme/theme_app.dart';

enum OperationBalance { BalanceToPay, BalanceReceivable }

class IndicatorOperationBalance extends StatelessWidget {
  final OperationBalance? operationBalance;
  IndicatorOperationBalance({@required this.operationBalance});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: operationBalance == OperationBalance.BalanceReceivable
            ? ThemeApp.config.primaryColor.withOpacity(.12)
            : Colors.red.withOpacity(.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        operationBalance == OperationBalance.BalanceReceivable
            ? ImagesApp.dollarCashIn
            : ImagesApp.dollarCahOut,
      ),
    );
  }
}
