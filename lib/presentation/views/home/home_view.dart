import 'package:flutter/material.dart';
import 'package:ocean_card/presentation/views/actions/actions.dart';
import 'package:ocean_card/presentation/views/actions/earn_money_view.dart';
import 'package:ocean_card/presentation/views/actions/reports_view.dart';
import 'package:ocean_card/presentation/views/home/widgets/recent_activity_list.dart';
import 'widgets/balance_card.dart';
import 'widgets/statistics_cards.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _showBalance = true;
  String _selectedCurrency = 'USD';
  final int _selectionStyle = 1; // 1 = full cards, 2 = selection buttons

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

  void _showHistory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'History',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Expanded(child: RecentActivityList()),
            ],
          ),
        ),
      ),
    );
  }

  void _goToReports(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const ReportsView()));
  }

  void _goToEarnMoney(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const EarnMoneyView()));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(backgroundColor: colorScheme.surface, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
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
                    const SizedBox(height: 12),

                    // Statistics cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          StatisticsCards(
                            colorScheme: colorScheme,
                            onEarnMoney: () => _goToEarnMoney(context),
                            onReports: () => _goToReports(context),
                            onHistory: () => _showHistory(context),
                          ),
                          const SizedBox(height: 32),
                        ],
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
