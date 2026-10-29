import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'sections/landing_page.dart';

class NourimApp extends StatefulWidget {
  const NourimApp({super.key});
  @override
  State<NourimApp> createState() => _NourimAppState();
}

class _NourimAppState extends State<NourimApp> {
  late final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            LandingPage(section: state.uri.queryParameters['section']),
      ),
    ],
  );
  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'NOURIM PROD — Solutions Digitales',
    debugShowCheckedModeBanner: false,
    theme: appTheme(),
    routerConfig: router,
  );
}
