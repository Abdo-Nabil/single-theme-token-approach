import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_theme_token_approach/theme/cubit/theme_cubit.dart';
import 'package:one_theme_token_approach/theme/cubit/theme_state.dart';

import 'home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ThemedApp());
}

class ThemedApp extends StatefulWidget {
  const ThemedApp({super.key});

  @override
  State<ThemedApp> createState() => _ThemedAppState();
}

class _ThemedAppState extends State<ThemedApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light(),
                darkTheme: AppTheme.dark(),
                themeMode: state.mode,
                home: const HomePage(),
              );
            },
          );
        },
      ),
    );
  }
}
