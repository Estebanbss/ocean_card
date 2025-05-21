import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Settings'),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Text(
          'Here you can change your card settings.',
          style: TextStyle(fontSize: 20, color: colorScheme.onSurface),
        ),
      ),
    );
  }
}
