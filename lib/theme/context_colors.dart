import 'package:flutter/material.dart';
import 'app_colors.g.dart';

extension AppColorsContext on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
