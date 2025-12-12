import 'package:flutter/material.dart';

import 'theme/context_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(title: const Text('Design Token Theming Demo')),
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
                ElevatedButton(child: Text('Primary action'), onPressed: () {}),
                const SizedBox(height: 16),
                Text('Success', style: TextStyle(color: colors.statusSuccess)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
