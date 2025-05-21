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
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(32),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.credit_card, size: 60, color: colorScheme.primary),
                const SizedBox(height: 16),
                Text(
                  'Card Number: **** 8456',
                  style: TextStyle(fontSize: 18, color: colorScheme.onSurface),
                ),
                const SizedBox(height: 8),
                Text(
                  'Cardholder: Alex Johnson',
                  style: TextStyle(fontSize: 18, color: colorScheme.onSurface),
                ),
                const SizedBox(height: 8),
                Text(
                  'Expiry: 12/27',
                  style: TextStyle(fontSize: 18, color: colorScheme.onSurface),
                ),
                const SizedBox(height: 24),
                Text(
                  'This is a virtual card for secure online payments.',
                  style: TextStyle(fontSize: 16, color: colorScheme.onSurface.withAlpha(180)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
