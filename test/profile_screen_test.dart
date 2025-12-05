import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/views/profile_screen.dart';

void main() {
  group('ProfileScreen', () {
    testWidgets('renders title and fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: ProfileScreen()),
      );

      expect(find.text('Profile'), findsOneWidget);
      expect(find.byKey(const Key('profile_name_field')), findsOneWidget);
      expect(find.byKey(const Key('profile_email_field')), findsOneWidget);
      expect(find.byKey(const Key('profile_extra_field')), findsOneWidget);
      expect(find.byKey(const Key('profile_save_button')), findsOneWidget);
    });

    testWidgets('Save button disables/enables based on required fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: ProfileScreen()),
      );

      final Finder saveButton = find.byKey(const Key('profile_save_button'));

      expect(saveButton, findsOneWidget);
      ElevatedButton button = tester.widget<ElevatedButton>(saveButton);
      expect(button.onPressed, isNull);

      await tester.enterText(
          find.byKey(const Key('profile_name_field')), 'Alex');
      await tester.enterText(
          find.byKey(const Key('profile_email_field')), 'a@b.com');
      await tester.pump();

      button = tester.widget<ElevatedButton>(saveButton);
      expect(button.onPressed, isNotNull);
    });

    testWidgets('shows snackbar when saving', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: ProfileScreen()),
      );

      await tester.enterText(
          find.byKey(const Key('profile_name_field')), 'Alex');
      await tester.enterText(
          find.byKey(const Key('profile_email_field')), 'a@b.com');
      await tester.pump();

      await tester.tap(find.byKey(const Key('profile_save_button')));
      await tester.pump(); // start snackbar animation
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Profile saved'), findsOneWidget);
    });
  });

  group('Navigation from App', () {
    testWidgets('opens ProfileScreen from Order screen',
        (WidgetTester tester) async {
      const App app = App();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      final Finder profileButton = find.text('Profile');
      await tester.ensureVisible(profileButton);
      await tester.tap(profileButton);
      await tester.pumpAndSettle();

      expect(find.byType(ProfileScreen), findsOneWidget);
    });
  });
}
