import 'dart:math';

import 'package:flutter/material.dart';

abstract class ThemeBase {
  Color get background;
  Color get primaryColor;
  Color get titleColor;
  Color get borderColor;
  Color get diviserColor;
  Color get statusbarSteps;
  Color get backgroundSteps;
  RadialGradient get radialGradient;

  double get padding;

  LinearGradient get linearGradient;
}

class ThemeApp implements ThemeBase {
  static ThemeApp config = ThemeApp();
  ThemeApp();
  @override
  // TODO: implement background
  Color get background => Color(0xFFFFFFFF);
  @override
  Color get titleColor => Color(0xFF40B28C);

  @override
  // TODO: implement primaryColor
  Color get primaryColor => Color(0xFF40B38C);

  Color get gray => Color(0xFF666666);

  @override
  // TODO: implement linearGradient
  LinearGradient get linearGradient => LinearGradient(
        colors: [
          Color(0xFF40B38C),
          Color(0xFF45CC93),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        transform: GradientRotation(2.35619 * pi),
      );

  @override
  // TODO: implement borderColor
  Color get borderColor => Color(0xFFDCE0E5);

  @override
  // TODO: implement diviserColor
  Color get diviserColor => Color(0xFF666666);

  @override
  // TODO: implement padding
  double get padding => 8.0;

  @override
  // TODO: implement statusbarSteps
  Color get statusbarSteps => Color(0xFFFFFFFF);

  @override
  // TODO: implement backgroundSteps
  Color get backgroundSteps => Color(0xFFFFFFFF);

  @override
  // TODO: implement radialGradient
  RadialGradient get radialGradient => RadialGradient(
        radius: 0.8,
        //focalRadius: .7,
        tileMode: TileMode.mirror,
        colors: [
          Color(0xFF59C692),
          Color(0xFF59C692),
          Color(0Xff4FB38C),
          Color(0Xff51B78E),
          Color(0Xff51B78E),
        ],
      );
}
