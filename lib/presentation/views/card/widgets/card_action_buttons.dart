import 'package:flutter/material.dart';

class CardActionButtons extends StatelessWidget {
  final VoidCallback onFreeze;
  final VoidCallback onDetails;
  final VoidCallback onSettings;

  const CardActionButtons({
    super.key,
    required this.onFreeze,
    required this.onDetails,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Freeze
        ElevatedButton.icon(
          onPressed: onFreeze,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            elevation: 2,
          ),
          icon: const Icon(Icons.lock, size: 20),
          label: const Text(
            'Freeze',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        // Details
        TextButton.icon(
          onPressed: onDetails,
          icon: Icon(Icons.info_outline, color: colorScheme.primary),
          label: const Text('Details'),
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        // Settings
        TextButton.icon(
          onPressed: onSettings,
          icon: Icon(Icons.settings, color: colorScheme.primary),
          label: const Text('Settings'),
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
