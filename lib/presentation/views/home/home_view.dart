import 'package:flutter/material.dart';
import 'package:ocean_card/presentation/views/actions/actions.dart';
import 'package:ocean_card/presentation/views/actions/reports_view.dart';
import 'widgets/balance_card.dart';
import 'widgets/statistics_cards.dart';
import 'widgets/quick_actions_container.dart';
import 'widgets/recent_activity_list.dart';
import 'widgets/actions_grid.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _showBalance = true;
  String _selectedCurrency = 'USD';
  final int _selectionStyle = 2; // 1 = full cards, 2 = selection buttons

  final List<Map<String, dynamic>> _currencies = [
    {
      'code': 'USD',
      'name': 'US Dollar',
      'symbol': '\$',
      'rate': 1.0,
      'svgAsset': 'assets/usd.svg',
    },
    {
      'code': 'USDT',
      'name': 'Tether',
      'symbol': '₮',
      'rate': 1.0,
      'svgAsset': 'assets/usdt.svg',
    },
    {
      'code': 'BTC',
      'name': 'Bitcoin',
      'symbol': '₿',
      'rate': 0.000024,
      'svgAsset': 'assets/btc.svg',
    },
  ];

  final double _balanceUSD = 1250.75;

  double get _currentBalance {
    final currency = _currencies.firstWhere(
      (c) => c['code'] == _selectedCurrency,
    );
    return _balanceUSD * currency['rate'];
  }

  String get _formattedBalance {
    final currency = _currencies.firstWhere(
      (c) => c['code'] == _selectedCurrency,
    );
    if (_selectedCurrency == 'BTC') {
      return '${currency['symbol']}${_currentBalance.toStringAsFixed(6)}';
    }
    return '${currency['symbol']}${_currentBalance.toStringAsFixed(2)}';
  }

  String get _balanceSubtitle {
    if (_selectedCurrency == 'USD') {
      return 'Balance in USD';
    } else if (_selectedCurrency == 'USDT') {
      return 'Balance in USDT';
    } else {
      return 'Balance invested in $_selectedCurrency';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Balance card with currency selection
                    BalanceCard(
                      showBalance: _showBalance,
                      onToggleVisibility: () {
                        setState(() {
                          _showBalance = !_showBalance;
                        });
                      },
                      formattedBalance: _formattedBalance,
                      balanceSubtitle: _balanceSubtitle,
                      balanceUSD: _balanceUSD,
                      selectedCurrency: _selectedCurrency,
                      currencies: _currencies,
                      onCurrencyChanged: (currency) {
                        setState(() {
                          _selectedCurrency = currency;
                        });
                      },
                      onAddFunds: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AddFundsView(),
                          ),
                        );
                      },
                      colorScheme: colorScheme,
                      selectionStyle:
                          _selectionStyle, // Pass the selection style
                    ),
                    const SizedBox(height: 24),

                    // Statistics cards
                    StatisticsCards(colorScheme: colorScheme),
                    const SizedBox(height: 28),

                    // Quick actions
                    QuickActionsContainer(
                      colorScheme: colorScheme,
                      onDepositTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const DepositView()),
                      ),
                      onExchangeTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ExchangeView()),
                      ),
                      onWithdrawTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const WithdrawView()),
                      ),
                      onCvuTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CvuView()),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Recent activity header and list
                    Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const RecentActivityList(),

                    // Actions grid
                    ActionsGrid(
                      colorScheme: colorScheme,
                      onTransferTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const TransferView()),
                      ),
                      onBuySellTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const BuySellView()),
                      ),
                      onEarnMoneyTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const EarnMoneyView(),
                        ),
                      ),
                      onReportsTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ReportsView()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
