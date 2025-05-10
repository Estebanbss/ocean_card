import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  final VoidCallback onNext;
  const PersonalInformation({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: ElevatedButton(
        onPressed: onNext,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
        ),
        child: const Text('Continuar'),
      ),
    );
  }
}
