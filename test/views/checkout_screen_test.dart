import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';

void main() {
  group('CheckoutScreen', () {
    late Cart cart;
    late Sandwich footlongVeggie;
    late Sandwich sixInchVeggie;

    setUp(() {
      cart = Cart();
      footlongVeggie = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      sixInchVeggie = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );
      cart.add(footlongVeggie, quantity: 1); // £11.00
      cart.add(sixInchVeggie, quantity: 3); // £21.00
    });

    testWidgets('shows order summary and correct totals', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CheckoutScreen(cart: cart),
        ),
      );

      expect(find.text('Order Summary'), findsOneWidget);
      expect(find.text('1x Veggie Delight'), findsOneWidget);
      expect(find.text('3x Veggie Delight'), findsOneWidget);
      expect(find.text('£11.00'), findsOneWidget);
      expect(find.text('£21.00'), findsOneWidget);
      expect(find.text('£32.00'), findsOneWidget);
    });

    testWidgets('shows processing state after confirming payment', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CheckoutScreen(cart: cart),
        ),
      );

      await tester.tap(find.text('Confirm Payment'));
      await tester.pump(); // rebuild after setState sets _isProcessing = true

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Processing payment...'), findsOneWidget);

      // Let the fake processing delay finish so no timers remain pending.
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
    });
  });
}
