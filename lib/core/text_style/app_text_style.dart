import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class IAppTextStyle {
  TextStyle get titleBalanceCard;
  TextStyle get titleEventTitle;
  TextStyle get subTitleEventTitle;
  TextStyle get subTitleBalanceCardCashIn;
  TextStyle get subTitleBalanceCardCashOut;
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
}
