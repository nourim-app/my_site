import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_site/app.dart';
import 'package:my_site/sections/contact_section.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    final loader = FontLoader('PlusJakartaSans')
      ..addFont(rootBundle.load('assets/fonts/PlusJakartaSans.ttf'));
    await loader.load();
    GoogleFonts.config.allowRuntimeFetching = false;
    GoogleFonts.manrope();
    await GoogleFonts.pendingFonts();
  });
  for (final width in [360.0, 768.0, 1200.0, 1440.0, 1920.0]) {
    testWidgets('Landing page fits $width and navigation works', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const NourimApp());
      await tester.pumpAndSettle();
      expect(find.text('NOURIM PROD'), findsWidgets);
      expect(tester.takeException(), isNull);
      if (find.byTooltip('Ouvrir le menu').evaluate().isNotEmpty) {
        await tester.tap(find.byTooltip('Ouvrir le menu'));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(ListTile, 'Contact'));
        await tester.pumpAndSettle();
      } else {
        await tester.tap(find.widgetWithText(TextButton, 'Contact').first);
        await tester.pumpAndSettle();
      }
      expect(find.byType(TextFormField).first.hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
  testWidgets('Contact validates and prepares a request without sending', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1000, 1800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: ContactSection())),
      ),
    );
    await tester.tap(find.text('Envoyer ma demande  →'));
    await tester.pumpAndSettle();
    expect(find.text('Saisissez un email valide.'), findsOneWidget);
    final fields = find.byType(TextFormField);
    for (final entry in [
      (0, 'Test Client'),
      (1, 'client@example.com'),
      (2, '+212612345678'),
      (4, 'Une application mobile pour gérer les commandes.'),
    ]) {
      await tester.enterText(fields.at(entry.$1), entry.$2);
    }
    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Application Mobile').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Envoyer ma demande  →'));
    await tester.pumpAndSettle();
    expect(find.text('Votre demande est prête'), findsOneWidget);
    expect(find.text('Copier'), findsOneWidget);
  });
}
