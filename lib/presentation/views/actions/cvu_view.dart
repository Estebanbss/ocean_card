import 'package:flutter/material.dart';

class CvuView extends StatelessWidget {
  const CvuView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CVU'),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.credit_card, size: 80, color: colorScheme.primary),
              const SizedBox(height: 24),
              Text(
                'Your CVU',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
              ),
              const SizedBox(height: 12),
              Text(
                'Your unique banking code for transfers and deposits.',
                style: TextStyle(fontSize: 16, color: colorScheme.onSurface.withAlpha(180)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SelectableText(
                '0000-1234-5678-9012',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
