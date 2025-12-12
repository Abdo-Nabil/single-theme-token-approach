import 'package:flutter/material.dart';

import 'app_colors.g.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: [AppThemeColors.light],
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: [AppThemeColors.dark],
  );
}
