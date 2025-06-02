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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            QuickActionButton(
              icon: Icons.download,
              label: 'Deposit',
              color: colorScheme.onPrimary,
              onTap: onDepositTap,
            ),
            QuickActionButton(
              icon: Icons.swap_horiz,
              label: 'Exchange',
              color: colorScheme.onPrimary,
              onTap: onExchangeTap,
            ),
            QuickActionButton(
              icon: Icons.upload,
              label: 'Withdraw',
              color: colorScheme.onPrimary,
              onTap: onWithdrawTap,
            ),
            QuickActionButton(
              icon: Icons.credit_card,
              label: 'Your CVU',
              color: colorScheme.onPrimary,
              onTap: onCvuTap,
            ),
          ],
        ),
      ),
    );
  }
}
