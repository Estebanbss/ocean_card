import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ocean_card/presentation/views/home/home_view.dart';
import 'package:ocean_card/presentation/views/home/widgets/home_action_card.dart';
import 'package:ocean_card/presentation/views/home/widgets/quick_action_button.dart';

// Mock GoRouter
class MockGoRouter extends GoRouter {
  MockGoRouter({required List<RouteBase> routes})
      : super(routes: routes, initialLocation: '/'); // Ensure initialLocation is set

  String? lastNavigatedPath;

  @override
  Future<T?> push<T extends Object?>(String location, {Object? extra}) {
    lastNavigatedPath = location;
    return Future.value(null);
  }

  @override
  void go(String location, {Object? extra}) {
    lastNavigatedPath = location;
  }
}

// Test utility
Widget createTestableWidget({required Widget child, required GoRouter router}) {
  return MaterialApp(
    home: InheritedGoRouter(
      goRouter: router,
      child: child,
    ),
  );
}

void main() {
  late MockGoRouter mockRouter;

  setUp(() {
    // Define a basic route for the home view itself, and any other needed for initialization
    mockRouter = MockGoRouter(routes: [
      GoRoute(path: '/', builder: (_, __) => const HomeView()), // Mock for initial route
      GoRoute(path: '/add-funds', builder: (_, __) => Container()),
      GoRoute(path: '/deposit', builder: (_, __) => Container()),
      GoRoute(path: '/exchange', builder: (_, __) => Container()),
      GoRoute(path: '/withdraw', builder: (_, __) => Container()),
      GoRoute(path: '/cvu', builder: (_, __) => Container()),
      GoRoute(path: '/transfer', builder: (_, __) => Container()),
      GoRoute(path: '/buy-sell', builder: (_, __) => Container()),
      GoRoute(path: '/card', builder: (_, __) => Container()),
      GoRoute(path: '/earn-money', builder: (_, __) => Container()),
    ]);
  });

  // Helper to pump HomeView with the mock router
  Future<void> pumpHomeView(WidgetTester tester) async {
    await tester.pumpWidget(
      createTestableWidget(child: const HomeView(), router: mockRouter),
    );
    // SvgPicture.asset might need this if it tries to load real assets.
    // For now, we are not directly testing SVG rendering, so this might not be strictly needed,
    // but good practice if assets were involved in rendering.
    await tester.pumpAndSettle();
  }

  testWidgets('tapping Add Funds button navigates to /add-funds', (WidgetTester tester) async {
    await pumpHomeView(tester);

    final addFundsButton = find.widgetWithText(ElevatedButton, 'Add funds');
    expect(addFundsButton, findsOneWidget);

    await tester.tap(addFundsButton);
    await tester.pumpAndSettle();

    expect(mockRouter.lastNavigatedPath, '/add-funds');
  });

  // QuickActionButtons
  testWidgets('tapping Deposit QuickActionButton navigates to /deposit', (WidgetTester tester) async {
    await pumpHomeView(tester);
    final button = find.widgetWithText(QuickActionButton, 'Deposit');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/deposit');
  });

  testWidgets('tapping Exchange QuickActionButton navigates to /exchange', (WidgetTester tester) async {
    await pumpHomeView(tester);
    final button = find.widgetWithText(QuickActionButton, 'Exchange');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/exchange');
  });

  testWidgets('tapping Withdraw QuickActionButton navigates to /withdraw', (WidgetTester tester) async {
    await pumpHomeView(tester);
    final button = find.widgetWithText(QuickActionButton, 'Withdraw');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/withdraw');
  });

  testWidgets('tapping Your CVU QuickActionButton navigates to /cvu', (WidgetTester tester) async {
    await pumpHomeView(tester);
    final button = find.widgetWithText(QuickActionButton, 'Your CVU');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/cvu');
  });

  // HomeActionCards
  testWidgets('tapping Transfer HomeActionCard navigates to /transfer', (WidgetTester tester) async {
    await pumpHomeView(tester);
    // We find by the title text within the HomeActionCard
    final card = find.widgetWithText(HomeActionCard, 'Transfer');
    expect(card, findsOneWidget);
    await tester.tap(card);
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/transfer');
  });

  testWidgets('tapping Buy & Sell HomeActionCard navigates to /buy-sell', (WidgetTester tester) async {
    await pumpHomeView(tester);
    final card = find.widgetWithText(HomeActionCard, 'Buy & Sell');
    expect(card, findsOneWidget);
    await tester.tap(card);
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/buy-sell');
  });

  testWidgets('tapping Ocean Card HomeActionCard navigates to /card', (WidgetTester tester) async {
    await pumpHomeView(tester);
    final card = find.widgetWithText(HomeActionCard, 'Ocean Card');
    expect(card, findsOneWidget);

    // The HomeActionCard itself is what we tap, not a child Text widget.
    await tester.tap(find.byWidgetPredicate(
      (widget) => widget is HomeActionCard && widget.title == 'Ocean Card'
    ));
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/card');
  });

  testWidgets('tapping Earn Money HomeActionCard navigates to /earn-money', (WidgetTester tester) async {
    await pumpHomeView(tester);
    final card = find.widgetWithText(HomeActionCard, 'Earn Money');
    expect(card, findsOneWidget);
    await tester.tap(card);
    await tester.pumpAndSettle();
    expect(mockRouter.lastNavigatedPath, '/earn-money');
  });
}
