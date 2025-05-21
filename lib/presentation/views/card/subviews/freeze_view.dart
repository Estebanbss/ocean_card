import 'package:flutter/material.dart';

class FreezeView extends StatelessWidget {
  const FreezeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freeze Card'),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Text(
          'Here you can freeze your card.',
          style: TextStyle(fontSize: 20, color: colorScheme.onSurface),
        ),
      ),
    );
  }
}
