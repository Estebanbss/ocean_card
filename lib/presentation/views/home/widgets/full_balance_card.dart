import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullBalanceCard extends StatelessWidget {
  final Map<String, dynamic> currency;
  final bool isSelected;
  final bool showBalance;
  final double balanceUSD;
  final ColorScheme colorScheme;

  const FullBalanceCard({
    super.key,
    required this.currency,
    required this.isSelected,
    required this.showBalance,
    required this.balanceUSD,
    required this.colorScheme,
  });

  double get _currentBalance {
    return balanceUSD * currency['rate'];
  }

  String get _formattedBalance {
    if (currency['code'] == 'BTC') {
      return '${currency['symbol']}${_currentBalance.toStringAsFixed(6)}';
    }
    return '${currency['symbol']}${_currentBalance.toStringAsFixed(2)}';
  }

  String get _balanceSubtitle {
    if (currency['code'] == 'USD') {
      return 'Balance in USD';
    } else if (currency['code'] == 'USDT') {
      return 'Balance in USDT';
    } else {
      return 'Balance invested in ${currency['code']}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con nombre de la moneda
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currency['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  currency['code'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          // Balance y avatar
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Balance info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      showBalance ? _formattedBalance : '••••••',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (showBalance && currency['code'] != 'USD')
                      Text(
                        '\$${balanceUSD.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    Text(
                      _balanceSubtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),

              // Currency avatar
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.2),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    currency['svgAsset'],
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
