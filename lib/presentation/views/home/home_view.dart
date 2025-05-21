import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/home_action_card.dart';
import 'widgets/quick_action_button.dart';

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
    final router = GoRouter.of(context);

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
                    // Tarjeta de saldo con gradiente y sombra
                    Container(
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
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                          const SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                router.go('/add-funds');
                              },
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
                                backgroundColor: colorScheme.primary.withAlpha(
                                  220,
                                ),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Estadísticas rápidas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _StatCard(
                          icon: Icons.compare_arrows,
                          label: 'Movements',
                          value: '12',
                          color: colorScheme.secondary,
                        ),
                        _StatCard(
                          icon: Icons.credit_card,
                          label: 'Cards',
                          value: '1',
                          color: colorScheme.primary,
                        ),
                        _StatCard(
                          icon: Icons.card_giftcard,
                          label: 'Rewards',
                          value: '\$50',
                          color: colorScheme.tertiary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

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
                          QuickActionButton(
                            icon: Icons.download,
                            label: 'Deposit',
                            color: Colors.white,
                            onTap: () => router.go('/deposit'),
                          ),
                          QuickActionButton(
                            icon: Icons.swap_horiz,
                            label: 'Exchange',
                            color: Colors.white,
                            onTap: () => router.go('/exchange'),
                          ),
                          QuickActionButton(
                            icon: Icons.upload,
                            label: 'Withdraw',
                            color: Colors.white,
                            onTap: () => router.go('/withdraw'),
                          ),
                          QuickActionButton(
                            icon: Icons.credit_card,
                            label: 'Your CVU',
                            color: Colors.white,
                            onTap: () => router.go('/cvu'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Últimos movimientos (mock)
                    Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _RecentActivityList(),

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
                          HomeActionCard(
                            title: 'Transfer',
                            icon: Icons.sync_alt,
                            description: 'Transfer your funds',
                            onTap: () => router.go('/transfer'),
                            colorScheme: colorScheme,
                          ),
                          HomeActionCard(
                            title: 'Buy & Sell',
                            icon: Icons.swap_horiz,
                            description: 'Buy and sell assets',
                            onTap: () => router.go('/buy-sell'),
                            colorScheme: colorScheme,
                          ),
                          HomeActionCard(
                            title: 'Ocean Card',
                            icon: Icons.credit_card,
                            svgIconPath: 'assets/card_black.svg',
                            description: 'Manage your card',
                            onTap: () => router.go('/card'),
                            colorScheme: colorScheme,
                          ),
                          HomeActionCard(
                            title: 'Earn Money',
                            icon: Icons.monetization_on,
                            description: 'Invite and earn rewards',
                            onTap: () => router.go('/earn-money'),
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

// Widget para estadísticas rápidas
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: color.withAlpha(180),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para lista de movimientos recientes (mock)
class _RecentActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final activities = [
      {
        'icon': Icons.arrow_upward,
        'title': 'Sent to John',
        'subtitle': 'Yesterday',
        'amount': '-\$120.00',
        'color': Colors.redAccent,
      },
      {
        'icon': Icons.arrow_downward,
        'title': 'Deposit',
        'subtitle': '2 days ago',
        'amount': '+\$500.00',
        'color': Colors.green,
      },
      {
        'icon': Icons.shopping_cart,
        'title': 'Amazon',
        'subtitle': '3 days ago',
        'amount': '-\$80.00',
        'color': colorScheme.primary,
      },
    ];

    return Column(
      children: activities.map((a) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: (a['color'] as Color).withValues(alpha: 0.15),
            child: Icon(a['icon'] as IconData, color: a['color'] as Color),
          ),
          title: Text(
            a['title'] as String,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(a['subtitle'] as String),
          trailing: Text(
            a['amount'] as String,
            style: TextStyle(
              color: a['color'] as Color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      }).toList(),
    );
  }
}
