// GENERATED FILE — DO NOT EDIT.
// Run: dart lib/theme/theme_generator.dart

import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color pageBg;
  final Color pageFg;
  final Color buttonPrimaryBg;
  final Color buttonPrimaryFg;
  final Color statusSuccess;
  const AppColors({required this.pageBg,required this.pageFg,required this.buttonPrimaryBg,required this.buttonPrimaryFg,required this.statusSuccess,});
  @override
  AppColors copyWith({
    Color? pageBg,
    Color? pageFg,
    Color? buttonPrimaryBg,
    Color? buttonPrimaryFg,
    Color? statusSuccess,
  }) => AppColors(
    pageBg: pageBg ?? this.pageBg,
    pageFg: pageFg ?? this.pageFg,
    buttonPrimaryBg: buttonPrimaryBg ?? this.buttonPrimaryBg,
    buttonPrimaryFg: buttonPrimaryFg ?? this.buttonPrimaryFg,
    statusSuccess: statusSuccess ?? this.statusSuccess,
  );
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      pageBg: Color.lerp(pageBg, other.pageBg, t)!,
      pageFg: Color.lerp(pageFg, other.pageFg, t)!,
      buttonPrimaryBg: Color.lerp(buttonPrimaryBg, other.buttonPrimaryBg, t)!,
      buttonPrimaryFg: Color.lerp(buttonPrimaryFg, other.buttonPrimaryFg, t)!,
      statusSuccess: Color.lerp(statusSuccess, other.statusSuccess, t)!,
    );
  }
}

class AppThemeColors {
  static const light = AppColors(
    pageBg: Color(0xffF5F5F5),
    pageFg: Color(0xff121212),
    buttonPrimaryBg: Color(0xff0065FF),
    buttonPrimaryFg: Color(0xffFFFFFF),
    statusSuccess: Color(0xff4CAF50),
  );

  static const dark = AppColors(
    pageBg: Color(0xff121212),
    pageFg: Color(0xffEDEDED),
    buttonPrimaryBg: Color(0xff4A8DFF),
    buttonPrimaryFg: Color(0xff000000),
    statusSuccess: Color(0xff81C784),
  );
}
