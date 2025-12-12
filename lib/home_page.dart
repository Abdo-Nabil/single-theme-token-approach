import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_theme_token_approach/theme/cubit/theme_cubit.dart';
import 'package:one_theme_token_approach/theme/cubit/theme_state.dart';

import 'theme/context_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Solid Theme System'),
            actions: [_ThemeModeMenu(selected: state.mode)],
          ),
          body: Center(
            child: Card(
              color: colors.pageBg,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hello themed world!',
                      style: TextStyle(
                        color: colors.pageFg,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Primary action'),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Success',
                      style: TextStyle(color: colors.statusSuccess),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ThemeModeMenu extends StatelessWidget {
  final ThemeMode selected;

  const _ThemeModeMenu({required this.selected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ThemeMode>(
      icon: const Icon(Icons.brightness_6),
      onSelected: (mode) {
        context.read<ThemeCubit>().setThemeMode(mode);
      },
      itemBuilder: (context) {
        return ThemeMode.values.map((mode) {
          return PopupMenuItem(
            value: mode,
            child: Row(
              children: [
                if (mode == selected) const Icon(Icons.check, size: 16),
                const SizedBox(width: 8),
                Text(mode.name),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
