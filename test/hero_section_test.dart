import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_site/core/theme/app_theme.dart';
import 'package:my_site/sections/header_section.dart';
import 'package:my_site/sections/hero_section.dart';
import 'package:my_site/sections/landing_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    final loader = FontLoader('PlusJakartaSans')
      ..addFont(rootBundle.load('assets/fonts/PlusJakartaSans.ttf'));
    await loader.load();
    final icons = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
    await icons.load();
    GoogleFonts.config.allowRuntimeFetching = false;
    GoogleFonts.manrope();
    await GoogleFonts.pendingFonts();
  });
  for (final size in [const Size(1440, 1050), const Size(390, 1500)]) {
    testWidgets('Hero keeps its quote and portfolio actions at ${size.width}', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      if (const bool.fromEnvironment('WRITE_HERO_PREVIEW')) {
        debugDisableShadows = false;
      }
      final target = <String>[];
      final boundaryKey = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          theme: appTheme(),
          home: RepaintBoundary(
            key: boundaryKey,
            child: Scaffold(
              body: Column(
                children: [
                  HeaderSection(
                    navigation: navigation,
                    active: 'accueil',
                    navigate: target.add,
                    onMenu: () {},
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: HeroSection(navigate: target.add),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.tap(find.text('Demander un devis gratuit'));
      await tester.pumpAndSettle();
      expect(target.last, 'contact');
      await tester.tap(find.text('Voir mes réalisations'));
      await tester.pumpAndSettle();
      expect(target.last, 'applications');
      if (const bool.fromEnvironment('WRITE_HERO_PREVIEW')) {
        await tester.runAsync(() async {
          final boundary =
              boundaryKey.currentContext!.findRenderObject()!
                  as RenderRepaintBoundary;
          final image = await boundary.toImage(pixelRatio: 1);
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          await Directory('build/previews').create(recursive: true);
          await File('build/previews/hero-${size.width.toInt()}.png')
              .writeAsBytes(bytes!.buffer.asUint8List());
          image.dispose();
        });
        debugDisableShadows = true;
      }
      await tester.pumpWidget(const SizedBox());
    });
  }
}
