import 'package:flutter/material.dart';
import 'quick_action_button.dart';

class QuickActionsContainer extends StatelessWidget {
  final ColorScheme colorScheme;
  final VoidCallback onDepositTap;
  final VoidCallback onExchangeTap;
  final VoidCallback onWithdrawTap;
  final VoidCallback onCvuTap;

  const QuickActionsContainer({
    super.key,
    required this.colorScheme,
    required this.onDepositTap,
    required this.onExchangeTap,
    required this.onWithdrawTap,
    required this.onCvuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: QuickActionButton(
            icon: Icons.download,
            label: 'Depositar',
            color: colorScheme.onPrimary,
            onTap: onDepositTap,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: QuickActionButton(
            icon: Icons.upload,
            label: 'Retirar',
            color: colorScheme.onPrimary,
            onTap: onWithdrawTap,
          ),
        ),
      ],
    );
  }
}
