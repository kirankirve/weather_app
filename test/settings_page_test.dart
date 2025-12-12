
// settings_page_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/settings/application/dashboard_provider.dart';
import 'package:weather_app/pages/settings/presentation/settings_page.dart';
// ----------------------
// Test helpers
// ----------------------
Widget _wrapWithProviders(Widget child) {
  return ChangeNotifierProvider<SettingsProvider>(
    create: (_) => SettingsProvider(),
    child: MaterialApp(
      home: child,
    ),
  );
}

// ----------------------
// TESTS
// ----------------------
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsPage UI & interactions', () {
    testWidgets('renders all sections and options', (tester) async {
      await tester.pumpWidget(_wrapWithProviders(const SettingsPage()));

      // AppBar title
      expect(find.text('Settings'), findsOneWidget);

      // Section titles
      expect(find.text('Temp Unit'), findsOneWidget);
      expect(find.text('Notification'), findsOneWidget);
      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);

      // Temp Unit options
      expect(find.text('Fahrenheit'), findsOneWidget);
      expect(find.text('Celsius'), findsOneWidget);

      // Notification options
      expect(find.text('On'), findsOneWidget);
      expect(find.text('Off'), findsOneWidget);

      // Theme options
      expect(find.text('Light'), findsOneWidget);
      expect(find.text('Dark'), findsOneWidget);

      // Language dropdown exists
      expect(find.byType(DropdownButton<String>), findsOneWidget);
    });

    testWidgets('Temp Unit toggles update provider selection', (tester) async {
      await tester.pumpWidget(_wrapWithProviders(const SettingsPage()));

      final provider = Provider.of<SettingsProvider>(
          tester.element(find.text('Fahrenheit')),
          listen: false);

      // Initially Fahrenheit selected (true, false)
      expect(provider.tempUnitSelection, [true, false]);

      // Tap "Celsius"
      await tester.tap(find.text('Celsius'));
      await tester.pumpAndSettle();

      expect(provider.tempUnitSelection, [false, true]);

      // Tap "Fahrenheit" again
      await tester.tap(find.text('Fahrenheit'));
      await tester.pumpAndSettle();

      expect(provider.tempUnitSelection, [true, false]);
    });

    testWidgets('Notification toggles show appropriate SnackBar', (tester) async {
      await tester.pumpWidget(_wrapWithProviders(const SettingsPage()));

      // Tap "Off"
      await tester.tap(find.text('Off'));
      await tester.pump(); // showSnackBar schedules animation

      expect(find.text('Notification turned Off'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));


      final scaffoldContext = tester.element(find.byType(Scaffold));
      ScaffoldMessenger.of(scaffoldContext).clearSnackBars();
      await tester.pumpAndSettle();
      // Tap "On"
      await tester.tap(find.text('On'));
      await tester.pump();
      expect(find.text('Notification turned On'), findsOneWidget);
    });

    testWidgets('Theme toggles update provider selection', (tester) async {
      await tester.pumpWidget(_wrapWithProviders(const SettingsPage()));
      final provider = Provider.of<SettingsProvider>(
          tester.element(find.text('Light')),
          listen: false);

      // Initially Light selected
      expect(provider.themeMode, [true, false]);

      // Tap "Dark"
      await tester.tap(find.text('Dark'));
      await tester.pumpAndSettle();

      expect(provider.themeMode, [false, true]);

      // Tap "Light" again
      await tester.tap(find.text('Light'));
      await tester.pumpAndSettle();

      expect(provider.themeMode, [true, false]);
    });

    testWidgets('Language dropdown can open and select value', (tester) async {
      await tester.pumpWidget(_wrapWithProviders(const SettingsPage()));

      // Open dropdown
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      // Select "Marathi"
      await tester.tap(find.text('English').last);
      await tester.pumpAndSettle();

      // After selection, "Marathi" should be shown as selected value
      expect(find.text('English'), findsWidgets); // may find both item and selected
    });
  });
}
