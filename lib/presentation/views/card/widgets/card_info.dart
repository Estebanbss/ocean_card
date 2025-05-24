import 'package:flutter/material.dart';
import '../../../../data/models/card_model.dart';

class CardInfo extends StatelessWidget {
  final CardModel card;

  const CardInfo({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Virtual Card',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 13,
            color: colorScheme.onSurface.withAlpha(128),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          card.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          card.lastDigits,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
