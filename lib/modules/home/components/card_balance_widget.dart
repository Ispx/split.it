import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/home/components/indicator_operation_balance.dart';

class CardBalanceWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final OperationBalance? operation;
  CardBalanceWidget({@required this.title, this.subTitle, this.operation});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IndicatorOperationBalance(
                  operationBalance: this.operation,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.title!,
                      style: AppTextStyle.instance.titleBalanceCard,
                    ),
                    Text(
                      this.subTitle!,
                      style: operation == OperationBalance.BalanceReceivable
                          ? AppTextStyle.instance.subTitleBalanceCardCashIn
                          : AppTextStyle.instance.subTitleBalanceCardCashOut,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
