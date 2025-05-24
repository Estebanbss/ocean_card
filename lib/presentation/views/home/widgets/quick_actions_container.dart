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
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuickActionButton(
            icon: Icons.download,
            label: 'Deposit',
            color: Colors.white,
            onTap: onDepositTap,
          ),
          QuickActionButton(
            icon: Icons.swap_horiz,
            label: 'Exchange',
            color: Colors.white,
            onTap: onExchangeTap,
          ),
          QuickActionButton(
            icon: Icons.upload,
            label: 'Withdraw',
            color: Colors.white,
            onTap: onWithdrawTap,
          ),
          QuickActionButton(
            icon: Icons.credit_card,
            label: 'Your CVU',
            color: Colors.white,
            onTap: onCvuTap,
          ),
        ],
      ),
    );
  }
}
