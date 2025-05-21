import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ocean_card/presentation/views/card/card_view.dart';
import 'package:ocean_card/presentation/views/actions/actions.dart';

import '../../navegador.dart';
import '../../presentation/views/home/home_view.dart';
import '../../presentation/views/login/login_view.dart';

CustomTransitionPage customTransitionPage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 100),
  );
}

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // ShellRoute para envolver las rutas principales con el Navegador
      ShellRoute(
        builder: (context, state, child) {
          return Navegador(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) {
              return customTransitionPage(const HomeView(), state);
            },
          ),
          GoRoute(
            path: '/card',
            pageBuilder: (context, state) {
              return customTransitionPage(const CardView(), state);
            },
          ),
          GoRoute(
            path: '/deposit',
            pageBuilder: (context, state) {
              return customTransitionPage(const DepositView(), state);
            },
          ),
          GoRoute(
            path: '/exchange',
            pageBuilder: (context, state) {
              return customTransitionPage(const ExchangeView(), state);
            },
          ),
          GoRoute(
            path: '/withdraw',
            pageBuilder: (context, state) {
              return customTransitionPage(const WithdrawView(), state);
            },
          ),
          GoRoute(
            path: '/cvu',
            pageBuilder: (context, state) {
              return customTransitionPage(const CvuView(), state);
            },
          ),
          GoRoute(
            path: '/add-funds',
            pageBuilder: (context, state) {
              return customTransitionPage(const AddFundsView(), state);
            },
          ),
          GoRoute(
            path: '/transfer',
            pageBuilder: (context, state) {
              return customTransitionPage(const TransferView(), state);
            },
          ),
          GoRoute(
            path: '/buy-sell',
            pageBuilder: (context, state) {
              return customTransitionPage(const BuySellView(), state);
            },
          ),
          GoRoute(
            path: '/earn-money',
            pageBuilder: (context, state) {
              return customTransitionPage(const EarnMoneyView(), state);
            },
          ),
        ],
      ),
      // Ruta para la vista de login
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return customTransitionPage(const LoginView(), state);
        },
      ),
      // Ruta catch-all para manejar páginas no encontradas
      GoRoute(
        path: '/:notFound(.*)',
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Página no encontrada'))),
      ),
    ],
  );
}
