import 'package:flutter/material.dart';

class EarnMoneyView extends StatelessWidget {
  const EarnMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earn Money'),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.monetization_on, size: 80, color: colorScheme.primary),
              const SizedBox(height: 24),
              Text(
                'Earn Money',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
              ),
              const SizedBox(height: 12),
              Text(
                'Invite friends and earn rewards for every successful referral!',
                style: TextStyle(fontSize: 16, color: colorScheme.onSurface.withAlpha(180)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: const Text('Invite Friends'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
