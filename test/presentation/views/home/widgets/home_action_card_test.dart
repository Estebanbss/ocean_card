import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ocean_card/presentation/views/home/widgets/home_action_card.dart';

void main() {
  // Define a dummy ColorScheme to pass to the widget
  const ColorScheme colorScheme = ColorScheme.light();

  testWidgets('Displays IconData when svgIconPath is null', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeActionCard(
            title: 'Test Card',
            icon: Icons.home,
            description: 'Test Description',
            onTap: () {},
            colorScheme: colorScheme,
            svgIconPath: null,
          ),
        ),
      ),
    );

    // Verify that an Icon widget is found for the main icon.
    // We expect two Icon widgets: one for the main icon and one for the chevron_right.
    // So we look for the one that is not chevron_right.
    expect(find.byWidgetPredicate((widget) => widget is Icon && widget.icon == Icons.home), findsOneWidget);
    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('Displays SvgPicture when svgIconPath is provided', (WidgetTester tester) async {
    // For SvgPicture.asset to work in tests, we need to ensure assets are available.
    // This often requires a specific test setup for assets, or mocking.
    // For now, we'll assume the test environment can handle it or we're checking type.
    // If 'assets/card_black.svg' is not found during test, this test might fail
    // not because of widget logic but due to asset loading.
    // A more robust way would involve using a TestAssetBundle.

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeActionCard(
            title: 'Test SVG Card',
            icon: Icons.error, // Fallback icon, should not be displayed
            svgIconPath: 'assets/card_black.svg', // Dummy path
            description: 'Test SVG Description',
            onTap: () {},
            colorScheme: colorScheme,
          ),
        ),
      ),
    );

    // We need to ensure that the SvgPicture is found.
    // The actual rendering of an SVG from a path in a test environment can be tricky.
    // flutter_svg_test package can be used for more robust SvgPicture testing.
    // For now, we check if SvgPicture widget is in the tree.
    expect(find.byType(SvgPicture), findsOneWidget);

    // Verify that the fallback Icon widget (Icons.error) is NOT found for the main icon.
    // The chevron_right icon will still be present.
    expect(find.byWidgetPredicate((widget) => widget is Icon && widget.icon == Icons.error), findsNothing);
  });

  testWidgets('Calls onTap when tapped', (WidgetTester tester) async {
    bool tapped = false;
    VoidCallback mockOnTap = () {
      tapped = true;
    };

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeActionCard(
            title: 'Tap Test Card',
            icon: Icons.touch_app,
            description: 'Tap Test Description',
            onTap: mockOnTap,
            colorScheme: colorScheme,
          ),
        ),
      ),
    );

    // Find the card (InkWell is part of HomeActionCard's implementation)
    expect(find.byType(InkWell), findsOneWidget);
    
    // Simulate a tap on the card
    await tester.tap(find.byType(InkWell));
    await tester.pump(); // Process the tap

    // Verify that the mock callback was called once
    expect(tapped, isTrue);
  });
}
