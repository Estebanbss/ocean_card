import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'selection_widget.dart';
import 'currency_card.dart';
import 'full_balance_card.dart';

class BalanceCard extends StatelessWidget {
  final bool showBalance;
  final VoidCallback onToggleVisibility;
  final String formattedBalance;
  final String balanceSubtitle;
  final double balanceUSD;
  final String selectedCurrency;
  final List<Map<String, dynamic>> currencies;
  final Function(String) onCurrencyChanged;
  final VoidCallback onAddFunds;
  final ColorScheme colorScheme;
  final int selectionStyle; // 1 = full cards, 2 = selection buttons

  const BalanceCard({
    super.key,
    required this.showBalance,
    required this.onToggleVisibility,
    required this.formattedBalance,
    required this.balanceSubtitle,
    required this.balanceUSD,
    required this.selectedCurrency,
    required this.currencies,
    required this.onCurrencyChanged,
    required this.onAddFunds,
    required this.colorScheme,
    this.selectionStyle = 2, // Default to selection buttons
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.secondary.withValues(alpha: 0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and visibility toggle (only show in button style)
          if (selectionStyle == 2) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assets value',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white.withAlpha(179),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    showBalance ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: onToggleVisibility,
                ),
              ],
            ),

            // Balance display and currency avatar
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Balance and currency info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showBalance ? formattedBalance : '••••••',
                        style: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (showBalance && selectedCurrency != 'USD')
                        Text(
                          '\$${balanceUSD.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withAlpha(179),
                          ),
                        ),
                      Text(
                        balanceSubtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withAlpha(153),
                        ),
                      ),
                    ],
                  ),
                ),

                // Selected currency avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(26),
                    border: Border.all(
                      color: Colors.white.withAlpha(76),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      currencies.firstWhere(
                        (c) => c['code'] == selectedCurrency,
                      )['svgAsset'],
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),
          ],

          // Currency selection widget with dynamic style
          SelectionWidget<Map<String, dynamic>>(
            items: currencies,
            selectedValue: currencies.firstWhere(
              (c) => c['code'] == selectedCurrency,
            ),
            cardItemBuilder: (currency) {
              final isSelected = currency['code'] == selectedCurrency;
              return CurrencyCard(currency: currency, isSelected: isSelected);
            },
            fullCardItemBuilder: selectionStyle == 1
                ? (currency) {
                    final isSelected = currency['code'] == selectedCurrency;
                    return FullBalanceCard(
                      currency: currency,
                      isSelected: isSelected,
                      showBalance: showBalance,
                      balanceUSD: balanceUSD,
                      colorScheme: colorScheme,
                    );
                  }
                : null,
            dropdownTextBuilder: (currency) => currency['name'] as String,
            onChanged: (currency) {
              if (currency != null) {
                onCurrencyChanged(currency['code']);
              }
            },
            style: selectionStyle,
          ),

          // Add space only if in card style, otherwise keep the existing spacing
          SizedBox(height: selectionStyle == 1 ? 8 : 18),

          // Add funds button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onAddFunds,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'Add funds',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary.withAlpha(220),
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: colorScheme.onPrimary.withAlpha(128),
                  width: 2,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
