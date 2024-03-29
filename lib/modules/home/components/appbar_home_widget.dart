import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/home/components/card_balance_widget.dart';
import 'package:split_it/modules/home/components/personal_image_widget.dart';
import 'package:split_it/modules/home/states/balance_states.dart';
import 'package:split_it/modules/login/controllers/login_controller.dart';

import '../../../main.dart';

class AppBarHomeWidget extends StatelessWidget {
  final UserModel? user;
  final BalanceState? state;
  AppBarHomeWidget({
    required this.user,
    required this.state,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ThemeApp.config.primaryColor,
      expandedHeight: 140,
      pinned: true,
      title: Container(
        padding: EdgeInsets.only(left: 16, right: 0),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                PersonalImageWidget(
                  urlImage: user!.photoUrl!,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  user!.firstName!.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                await getIt<LoginController>().signOut();
                exit(0);
              },
            )
          ],
        ),
      ),
      flexibleSpace: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -80,
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: _buildByState(this.state!),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildByState(BalanceState state) {
  switch (state.runtimeType) {
    case BalanceStateEmpity:
    case BalanceStateLoading:
      return _CardBalanceShimmer();
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
              amount: Formater.currencyAmount(balanceModel.amountRecived!),
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
              amount: '-${Formater.currencyAmount(balanceModel.amountToPay!)}',
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

class _CardBalanceShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        Expanded(
          flex: 4,
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade200,
            child: CardBalanceWidget(
              imagePath: ImagesApp.dollarCashIn,
              textStyle: AppTextStyle.instance.subTitleBalanceCardCashIn,
              title: '',
              amount: '',
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 4,
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade200,
            child: CardBalanceWidget(
              imagePath: ImagesApp.dollarCahOut,
              textStyle: TextStyle(),
              title: '',
              amount: '',
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
