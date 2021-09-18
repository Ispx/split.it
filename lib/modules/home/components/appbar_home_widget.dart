import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/home/components/card_balance_widget.dart';
import 'package:split_it/modules/home/components/indicator_operation_balance.dart';

class AppBarHomeWidget extends PreferredSize {
  AppBarHomeWidget(UserModel user, BuildContext context)
      : super(
          preferredSize: Size.fromHeight(
            180,
          ),
          child: SafeArea(
            child: Container(
              color: ThemeApp.config.background,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).viewPadding.top,
                    left: 32,
                    right: 32,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.network(user.photoUrl!),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                user.firstName.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 48,
                            height: 56,
                            decoration: BoxDecoration(
                              color: ThemeApp.config.background,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.fromBorderSide(
                                BorderSide(
                                  width: 0.5,
                                  color: Colors.white38,
                                ),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -90,
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 4,
                          child: CardBalanceWidget(
                            title: 'A receber',
                            subTitle: 'R\$ 1200.00',
                            subtitleColor: Colors.green,
                            icon: Icon(Icons.monetization_on),
                            operation: OperationBalance.BalanceReceivable,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 4,
                          child: CardBalanceWidget(
                            title: 'A pagar',
                            subTitle: 'R\$ 200.00',
                            subtitleColor: Colors.red,
                            icon: Icon(Icons.monetization_on),
                            operation: OperationBalance.BalanceToPay,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
