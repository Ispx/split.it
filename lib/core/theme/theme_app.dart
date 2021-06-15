import 'dart:math';

import 'package:flutter/material.dart';

abstract class ThemeBase {
  Color get background;
  Color get primaryColor;
  LinearGradient get linearGradient;
}

class ThemeAppConfig implements ThemeBase {
  @override
  // TODO: implement background
  Color get background => Color(0xFF40B38C);

  @override
  // TODO: implement primaryColor
  Color get primaryColor => Color(0xFF40B38C);

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
}

class ThemeApp {
  static ThemeAppConfig get colors => ThemeAppConfig();
}
