import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _showBalance = true;
  String _selectedCurrency = 'USD';

  final List<String> _currencies = ['USD', 'EUR', 'COP'];
  final double _balance = 1250.75;

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
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top container: Assets value and actions
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Subtitle and eye icon
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
                                  _showBalance
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showBalance = !_showBalance;
                                  });
                                },
                              ),
                            ],
                          ),
                          // Value and currency
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _showBalance
                                    ? '\$${_balance.toStringAsFixed(2)}'
                                    : '••••••',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(width: 12),
                              DropdownButton<String>(
                                value: _selectedCurrency,
                                underline: const SizedBox(),
                                dropdownColor: colorScheme.surface,
                                style: TextStyle(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                items: _currencies
                                    .map(
                                      (c) => DropdownMenuItem(
                                        value: c,
                                        child: Text(c),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedCurrency = value;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add funds action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: Colors.white,
                                side: BorderSide(
                                  color: colorScheme.onPrimary.withAlpha(128),
                                  width: 2,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                elevation: 2,
                              ),
                              child: const Text(
                                'Add funds',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Quick actions container
                    Container(
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
                          _QuickActionButton(
                            icon: Icons.download,
                            label: 'Deposit',
                            color: Colors.white,
                            onTap: () {},
                          ),
                          _QuickActionButton(
                            icon: Icons.swap_horiz,
                            label: 'Exchange',
                            color: Colors.white,
                            onTap: () {},
                          ),
                          _QuickActionButton(
                            icon: Icons.upload,
                            label: 'Withdraw',
                            color: Colors.white,
                            onTap: () {},
                          ),
                          _QuickActionButton(
                            icon: Icons.credit_card,
                            label: 'Your CVU',
                            color: Colors.white,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    // Actions grid
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.95,
                        children: [
                          _HomeActionCard(
                            title: 'Transfer',
                            icon: Icons.sync_alt,
                            description: 'Transfer your funds',
                            onTap: () {},
                            colorScheme: colorScheme,
                          ),
                          _HomeActionCard(
                            title: 'Buy & Sell',
                            icon: Icons.swap_horiz,
                            description: 'Buy and sell assets',
                            onTap: () {},
                            colorScheme: colorScheme,
                          ),
                          _HomeActionCard(
                            title: 'Ocean Card',
                            icon: Icons.credit_card,
                            description: 'Manage your card',
                            onTap: () {},
                            colorScheme: colorScheme,
                          ),
                          _HomeActionCard(
                            title: 'Earn Money',
                            icon: Icons.monetization_on,
                            description: 'Invite and earn rewards',
                            onTap: () {},
                            colorScheme: colorScheme,
                          ),
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

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: color, size: 32),
          onPressed: onTap,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _HomeActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final VoidCallback onTap;
  final ColorScheme colorScheme;

  const _HomeActionCard({
    required this.title,
    required this.icon,
    required this.description,
    required this.onTap,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorScheme.primaryContainer.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title and action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    color: colorScheme.primary,
                    onPressed: onTap,
                  ),
                ],
              ),
              // Central icon
              Expanded(
                child: Center(
                  child: Icon(icon, size: 56, color: colorScheme.primary),
                ),
              ),
              // Bottom description
              Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                  color: colorScheme.onSurface.withAlpha(128),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
