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
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          ListTile(
            leading: Icon(Icons.lock, color: colorScheme.primary),
            title: const Text('Change PIN'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.visibility_off, color: colorScheme.primary),
            title: const Text('Hide Card Number'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.delete, color: colorScheme.primary),
            title: const Text('Delete Card'),
            onTap: () {},
          ),
          const SizedBox(height: 24),
          Text(
            'Manage your card settings here.',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withAlpha(180),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
