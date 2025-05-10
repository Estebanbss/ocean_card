import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ocean_card/core/configuration/tema/tema_cubit.dart';

// import 'presentation/blocs/autenticacion/autenticacion_bloc.dart';

class Navegador extends StatefulWidget {
  final Widget child;
  const Navegador({super.key, required this.child});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<Navegador> {
  int _selectedIndex = 0;
  bool hoverTheme = false;
  bool hoverLogout = false;
  bool hoverNotifications = false;
  bool _isNavigationRailExpanded = false;

  @override
  void initState() {
    super.initState();
    _updateSelectedIndexFromRoute();
  }

  void _updateSelectedIndexFromRoute() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final location = GoRouter.of(
        context,
      ).routerDelegate.currentConfiguration.fullPath;
      final parts = location.split('/');

      if (parts.length > 1) {
        int newIndex = _selectedIndex;
        switch (parts[1]) {
          case 'home':
            newIndex = 0;
            break;
          case 'reservas':
            newIndex = 1;
            break;
        }

        if (_selectedIndex != newIndex) {
          setState(() => _selectedIndex = newIndex);
        }
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/reservas');
        break;
    }
  }

  Widget _buildThemeButton(bool isDark) {
    return MouseRegion(
      onEnter: (_) => setState(() => hoverTheme = true),
      onExit: (_) => setState(() => hoverTheme = false),
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 300),
        turns: hoverTheme ? 0.125 : 0.0,
        child: IconButton(
          icon: Icon(
            isDark ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () => context.read<TemaCubit>().toggleTheme(),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => hoverLogout = true),
      onExit: (_) => setState(() => hoverLogout = false),
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 300),
        turns: hoverLogout ? 0.05 : 0.0,
        child: IconButton(
          icon: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            // context.read<AutenticacionBloc>().add(CerrarSesion());
            GoRouter.of(context).go('/login');
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    List<NavigationRailDestination> destinations;

    destinations = const [
      NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
      NavigationRailDestination(
        icon: Icon(Icons.event_available),
        label: Text('Reservas'),
      ),
    ];

    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: _isNavigationRailExpanded ? 180 : 90,
          child: NavigationRail(
            extended: _isNavigationRailExpanded,
            minWidth: 90,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: _isNavigationRailExpanded
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.selected,
            indicatorColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.2),
            selectedIconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedLabelTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            unselectedIconTheme: IconThemeData(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            unselectedLabelTextStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            destinations: destinations,
          ),
        ),
        const VerticalDivider(width: 2, thickness: 1),
        Expanded(child: widget.child),
      ],
    );
  }

  Widget _buildMobileNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 15,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.primary,
      ),
      selectedLabelStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      unselectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      unselectedLabelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available),
          label: 'Reservas',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemaCubit, bool>(
      builder: (context, isDarkTheme) {
        return Scaffold(
          appBar: AppBar(
            leading: MediaQuery.of(context).size.width > 800
                ? IconButton(
                    icon: Icon(
                      _isNavigationRailExpanded ? Icons.menu_open : Icons.menu,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      setState(() {
                        _isNavigationRailExpanded = !_isNavigationRailExpanded;
                      });
                    },
                  )
                : null,
            title: Text(
              'Sync-Re 🔄',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            actions: [_buildLogoutButton(), _buildThemeButton(isDarkTheme)],
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? _buildDesktopLayout()
                  : widget.child;
            },
          ),
          bottomNavigationBar: LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth <= 800
                  ? _buildMobileNavigation()
                  : const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
