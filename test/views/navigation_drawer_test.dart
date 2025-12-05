import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/views/profile_screen.dart';

void main() {
  group('Navigation Drawer', () {
    testWidgets('opens drawer and shows navigation items',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('drawer_order')), findsOneWidget);
      expect(find.byKey(const Key('drawer_cart')), findsOneWidget);
      expect(find.byKey(const Key('drawer_profile')), findsOneWidget);
    });

    testWidgets('tapping Cart navigates to Cart screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('drawer_cart')));
      await tester.pumpAndSettle();

      expect(find.byType(CartScreen), findsOneWidget);
      expect(find.text('Cart'), findsWidgets);
    });

    testWidgets('tapping Profile navigates to Profile screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('drawer_profile')));
      await tester.pumpAndSettle();

      expect(find.byType(ProfileScreen), findsOneWidget);
      expect(find.text('Profile'), findsWidgets);
    });

    testWidgets('tapping Order keeps user on Order screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('drawer_order')));
      await tester.pumpAndSettle();

      expect(find.byType(OrderScreen), findsOneWidget);
      expect(find.text('Sandwich Counter'), findsWidgets);
    });
  });
}
