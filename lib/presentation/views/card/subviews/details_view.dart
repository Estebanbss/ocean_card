import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Details'),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Text(
          'Here are the card details.',
          style: TextStyle(fontSize: 20, color: colorScheme.onSurface),
        ),
      ),
    );
  }
}
