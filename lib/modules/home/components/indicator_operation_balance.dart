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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(
                    width: 2,
                    color:
                        operationBalance == OperationBalance.BalanceReceivable
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                  ),
                ),
              ),
            ),
          ),
          Image.asset(
            operationBalance == OperationBalance.BalanceReceivable
                ? ImagesApp.dollarCashIn
                : ImagesApp.dollarCahOut,
          )
        ],
      ),
    );
  }
}
