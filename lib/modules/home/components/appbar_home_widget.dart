import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/home/components/card_balance_widget.dart';
import 'package:split_it/modules/home/states/balance_states.dart';

class AppBarHomeWidget extends PreferredSize {
  AppBarHomeWidget(UserModel user, BalanceState state, BuildContext context)
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
                    child: _buildByState(state),
                  ),
                ],
              ),
            ),
          ),
        );
}

Widget _buildByState(BalanceState state) {
  switch (state.runtimeType) {
    case BalanceStateEmpity:
    case BalanceStateLoading:
      return Center(child: CircularProgressIndicator());
    case BalanceStateDone:
      final balanceModel = (state as BalanceStateDone).balance;
      return Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 4,
            child: CardBalanceWidget(
              imagePath: ImagesApp.dollarCashIn,
              textStyle: AppTextStyle.instance.subTitleBalanceCardCashIn,
              title: 'A receber',
              amount:
                  'R\$ ${balanceModel.amountRecived?.toStringAsFixed(2).replaceAll('.', ',')}',
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 4,
            child: CardBalanceWidget(
              imagePath: ImagesApp.dollarCahOut,
              textStyle: AppTextStyle.instance.subTitleBalanceCardCashOut,
              title: 'A pagar',
              amount:
                  'R\$ -${balanceModel.amountToPay?.toStringAsFixed(2).replaceAll('.', ',')}',
            ),
          ),
          Expanded(child: Container()),
        ],
      );

    case BalanceStateError:
      return Center(
        child: Text((state as BalanceStateError).message),
      );
    default:
      return Center(
        child: Text('Estado da requisão não mapeado.'),
      );
  }
}
