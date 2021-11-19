import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/core/theme/theme_app.dart';

abstract class IAppTextStyle {
  TextStyle get titleBalanceCard;
  TextStyle get titleEventTitle;
  TextStyle get subTitleEventTitle;
  TextStyle get subTitleBalanceCardCashIn;
  TextStyle get subTitleBalanceCardCashOut;
  TextStyle get progressStepsLeft;
  TextStyle get progressStepsRight;
  TextStyle get titleButtomSteps;
  TextStyle get titleStepOne;
  TextStyle get hintTextFieldStepOne;
  TextStyle get subTitleStepOne;
}

class AppTextStyle implements IAppTextStyle {
  static AppTextStyle instance = AppTextStyle();
  @override
  TextStyle get subTitleBalanceCardCashIn => GoogleFonts.montserrat(
      fontWeight: FontWeight.w600, color: Color(0xFF40B28C), fontSize: 20);

  @override
  TextStyle get titleBalanceCard => GoogleFonts.inter(
      fontWeight: FontWeight.w400, color: Color(0xFF666666), fontSize: 14);

  @override
  TextStyle get subTitleBalanceCardCashOut => GoogleFonts.montserrat(
      fontWeight: FontWeight.w600, color: Color(0xFFE83F5B), fontSize: 20);

  @override
  TextStyle get titleEventTitle => GoogleFonts.inter(
      fontWeight: FontWeight.w600, color: Color(0xFF666666), fontSize: 16);

  @override
  TextStyle get subTitleEventTitle => GoogleFonts.inter(
      fontWeight: FontWeight.w400, color: Color(0xFF666666), fontSize: 12);

  @override
  // TODO: implement progressSteps
  TextStyle get progressStepsLeft => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        color: ThemeApp.config.primaryColor,
      );
  @override
  // TODO: implement progressSteps
  TextStyle get progressStepsRight => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        color: ThemeApp.config.gray,
      );

  @required
  TextStyle get titleButtomSteps => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        color: ThemeApp.config.gray,
      );

  @override
  // TODO: implement titleStepOne
  TextStyle get titleStepOne => GoogleFonts.montserrat(
      fontWeight: FontWeight.w700, color: Colors.black, fontSize: 22);

  @override
  // TODO: implement subTitleStepOne
  TextStyle get subTitleStepOne => GoogleFonts.montserrat(
      fontWeight: FontWeight.w400, color: Color(0xFF455250), fontSize: 22);

  @override
  // TODO: implement hintTextFieldStepOne
  TextStyle get hintTextFieldStepOne => GoogleFonts.inter(
      fontWeight: FontWeight.w400, color: Color(0xFF666666), fontSize: 14);
}
