import 'dart:convert';
import 'dart:io';

void main() {
  final file = File('lib/theme/design_tokens/colors.json');
  if (!file.existsSync()) {
    print('########### ERROR: colors.json not found.');
    exit(1);
  }

  final json = jsonDecode(file.readAsStringSync());
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED FILE — DO NOT EDIT.');
  buffer.writeln('// Run: dart lib/theme/theme_generator.dart');
  buffer.writeln('');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln('');
  buffer.writeln('class AppColors extends ThemeExtension<AppColors> {');

  // fields
  json.forEach((name, _) {
    buffer.writeln('  final Color $name;');
  });

  // constructor
  buffer.write('  const AppColors({');
  json.forEach((name, _) {
    buffer.write('required this.$name,');
  });
  buffer.writeln('});');

  // copyWith (optional)
  buffer.writeln('  @override');
  buffer.writeln('  AppColors copyWith({');
  json.forEach((name, _) {
    buffer.writeln('    Color? $name,');
  });
  buffer.writeln('  }) => AppColors(');
  json.forEach((name, _) {
    buffer.writeln('    $name: $name ?? this.$name,');
  });
  buffer.writeln('  );');

  // lerp (optional)
  buffer.writeln('  @override');
  buffer.writeln(
    '  AppColors lerp(ThemeExtension<AppColors>? other, double t) {',
  );
  buffer.writeln('    if (other is! AppColors) return this;');
  buffer.writeln('    return AppColors(');
  json.forEach((name, _) {
    buffer.writeln('      $name: Color.lerp($name, other.$name, t)!,');
  });
  buffer.writeln('    );');
  buffer.writeln('  }');

  buffer.writeln('}');

  // generate light & dark instances
  buffer.writeln('');
  buffer.writeln('class AppThemeColors {');
  buffer.writeln('  static const light = AppColors(');
  json.forEach((name, value) {
    final hex = value['light'].replaceFirst('#', '0xff');
    buffer.writeln('    $name: Color($hex),');
  });
  buffer.writeln('  );');

  buffer.writeln('');
  buffer.writeln('  static const dark = AppColors(');
  json.forEach((name, value) {
    final hex = value['dark'].replaceFirst('#', '0xff');
    buffer.writeln('    $name: Color($hex),');
  });
  buffer.writeln('  );');

  buffer.writeln('}');

  // write file
  final output = File('lib/theme/app_colors.g.dart');
  output.writeAsStringSync(buffer.toString());

  print('Generated lib/theme/app_colors.g.dart');
}
