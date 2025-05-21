import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocean_card/presentation/views/card/subviews/freeze_view.dart';
import 'package:ocean_card/presentation/views/card/subviews/details_view.dart';
import 'package:ocean_card/presentation/views/card/subviews/settings_view.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _HomeCardCarouselScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class _CardData {
  final String svgAsset;
  final double available;
  final String name;
  final String lastDigits;
  final List<_Movement> history;

  _CardData({
    required this.svgAsset,
    required this.available,
    required this.name,
    required this.lastDigits,
    required this.history,
  });
}

class _Movement {
  final String title;
  final String amount;
  final String date;

  _Movement(this.title, this.amount, this.date);
}

class _CardCarousel extends StatelessWidget {
  final List<_CardData> cards;
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const _CardCarousel({
    required this.cards,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity == null) return;
          if (details.primaryVelocity! < 0 && currentIndex < cards.length - 1) {
            onChanged(currentIndex + 1);
          } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
            onChanged(currentIndex - 1);
          }
        },
        child: ScrollConfiguration(
          behavior: _HomeCardCarouselScrollBehavior(),
          child: PageView.builder(
            controller: PageController(initialPage: currentIndex),
            itemCount: cards.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(
                  horizontal: index == currentIndex ? 0 : 16,
                  vertical: index == currentIndex ? 0 : 16,
                ),
                child: SvgPicture.asset(
                  cards[index].svgAsset,
                  fit: BoxFit.contain,
                  width: 250,
                  height: 173,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CardViewState extends State<CardView> {
  int _currentIndex = 0;

  final List<_CardData> _cards = [
    _CardData(
      svgAsset: 'assets/card_black.svg',
      available: 1250.75,
      name: 'Alex Johnson',
      lastDigits: '****8456',
      history: [
        _Movement('Sent to John', '-\$120.00', 'Yesterday'),
        _Movement('Deposit', '+\$500.00', '2 days ago'),
        _Movement('Amazon', '-\$80.00', '3 days ago'),
        _Movement('Coffee Shop', '-\$4.50', 'Today'),
        _Movement('ATM Withdrawal', '-\$100.00', 'Yesterday'),
        _Movement('Salary', '+\$1500.00', '2 days ago'),
        _Movement('Netflix', '-\$12.99', '2 days ago'),
        _Movement('Uber', '-\$8.20', '3 days ago'),
        _Movement('Grocery Store', '-\$54.10', '3 days ago'),
        _Movement('Transfer Received', '+\$200.00', '4 days ago'),
        _Movement('Bookstore', '-\$23.00', '5 days ago'),
        _Movement('Pharmacy', '-\$15.75', '6 days ago'),
        _Movement('Gym Membership', '-\$45.00', '1 week ago'),
      ],
    ),
    // _CardData(
    //   svgAsset: 'assets/card_yellow.svg',
    //   available: 320.40,
    //   name: 'Maria Smith',
    //   lastDigits: '****3921',
    //   history: [
    //     _Movement('Online Shopping', '-\$32.00', 'Today'),
    //     _Movement('Transfer Received', '+\$200.00', 'Yesterday'),
    //     _Movement('Supermarket', '-\$54.60', '3 days ago'),
    //     _Movement('Spotify', '-\$9.99', '3 days ago'),
    //     _Movement('Taxi', '-\$14.00', '4 days ago'),
    //     _Movement('Coffee Shop', '-\$5.20', '5 days ago'),
    //     _Movement('Gift Received', '+\$50.00', '6 days ago'),
    //     _Movement('Restaurant', '-\$38.00', '6 days ago'),
    //     _Movement('Pharmacy', '-\$11.50', '1 week ago'),
    //     _Movement('Gym Membership', '-\$45.00', '1 week ago'),
    //   ],
    // ),
  ];

  void _openFreeze() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const FreezeView()));
  }

  void _openDetails() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const DetailsView()));
  }

  void _openSettings() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const SettingsView()));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final card = _cards[_currentIndex];

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'My current cards',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Available value
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Colors.white.withAlpha(179),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${card.available.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Card carousel
                    SizedBox(
                      height: 200, // O la altura que necesites
                      child: _CardCarousel(
                        cards: _cards,
                        currentIndex: _currentIndex,
                        onChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Carousel indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_cards.length, (i) {
                        return Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: i == _currentIndex
                                ? colorScheme.primary
                                : colorScheme.primary.withAlpha(77),
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 32),

                    // Card info
                    Column(
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
                    ),
                    const SizedBox(height: 24),

                    // Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Freeze
                        ElevatedButton.icon(
                          onPressed: _openFreeze,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 14,
                            ),
                            elevation: 2,
                          ),
                          icon: const Icon(Icons.lock, size: 20),
                          label: const Text(
                            'Freeze',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Details
                        TextButton.icon(
                          onPressed: _openDetails,
                          icon: Icon(
                            Icons.info_outline,
                            color: colorScheme.primary,
                          ),
                          label: const Text('Details'),
                          style: TextButton.styleFrom(
                            foregroundColor: colorScheme.primary,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Settings
                        TextButton.icon(
                          onPressed: _openSettings,
                          icon: Icon(
                            Icons.settings,
                            color: colorScheme.primary,
                          ),
                          label: const Text('Settings'),
                          style: TextButton.styleFrom(
                            foregroundColor: colorScheme.primary,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Movements history
                    Text(
                      'History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: card.history.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, thickness: 0.5),
                      itemBuilder: (context, idx) {
                        final m = card.history[idx];
                        final isNegative = m.amount.startsWith('-');
                        final isPositive = m.amount.startsWith('+');
                        IconData icon;
                        Color iconColor;
                        if (isNegative) {
                          icon = Icons.arrow_upward;
                          iconColor = Colors.redAccent;
                        } else if (isPositive) {
                          icon = Icons.arrow_downward;
                          iconColor = Colors.green;
                        } else {
                          icon = Icons.swap_horiz;
                          iconColor = colorScheme.primary;
                        }
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: iconColor.withValues(alpha:0.15),
                            child: Icon(icon, color: iconColor),
                          ),
                          title: Text(
                            m.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(m.date),
                          trailing: Text(
                            m.amount,
                            style: TextStyle(
                              color: iconColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
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
