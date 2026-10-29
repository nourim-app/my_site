import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/config/contact_config.dart';
import '../core/theme/app_theme.dart';
import '../widgets/shared.dart';
import '../widgets/brand_logo.dart';
import 'header_section.dart';
import 'hero_section.dart';
import 'applications_section.dart';
import 'automation_section.dart';
import 'contact_section.dart';

const navigation = [
  ('Accueil', 'accueil'),
  ('Services', 'services'),
  ('Applications', 'applications'),
  ('IA & Automatisation', 'automation'),
  ('Réalisations', 'realisations'),
  ('À propos', 'apropos'),
  ('Contact', 'contact'),
];

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, this.section});
  final String? section;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final keys = {for (final n in navigation) n.$2: GlobalKey()};
  final scaffold = GlobalKey<ScaffoldState>();
  final scroll = ScrollController();
  String active = 'accueil';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => jump(widget.section));
  }

  @override
  void didUpdateWidget(covariant LandingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.section != widget.section) {
      WidgetsBinding.instance.addPostFrameCallback((_) => jump(widget.section));
    }
  }

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  void jump(String? id) {
    if (!mounted || id == null) return;
    final target =
        keys[id == 'realisations' ? 'applications' : id]?.currentContext;
    if (target != null) {
      setState(() => active = id);
      Scrollable.ensureVisible(
        target,
        duration: MediaQuery.disableAnimationsOf(context)
            ? Duration.zero
            : const Duration(milliseconds: 550),
        curve: Curves.easeInOut,
      );
    }
  }

  void navigate(String id) {
    if (widget.section == id) {
      jump(id);
    } else {
      context.go('/?section=$id');
    }
  }

  Widget logo({bool light = false}) => BrandLogo(light: light, compact: true);
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) => Scaffold(
      key: scaffold,
      backgroundColor: const Color(0xFFF6F8FC),
      endDrawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              logo(),
              const SizedBox(height: 28),
              ...navigation.map(
                (n) => ListTile(
                  title: Text(n.$1),
                  selected: active == n.$2,
                  onTap: () {
                    Navigator.pop(context);
                    navigate(n.$2);
                  },
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  navigate('contact');
                },
                child: const Text('Demander un devis'),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          HeaderSection(
            navigation: navigation,
            active: active,
            navigate: navigate,
            onMenu: () => scaffold.currentState!.openEndDrawer(),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scroll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Reveal(
                    key: keys['accueil'],
                    child: HeroSection(navigate: navigate),
                  ),
                  Reveal(
                    key: keys['applications'],
                    child: const ApplicationsSection(),
                  ),
                  Reveal(key: keys['services'], child: const ServicesSection()),
                  Reveal(
                    key: keys['automation'],
                    child: AutomationSection(
                      onContact: () => navigate('contact'),
                    ),
                  ),
                  Reveal(key: keys['apropos'], child: const AboutSection()),
                  const Reveal(child: ProcessSection()),
                  Reveal(key: keys['contact'], child: const ContactSection()),
                  ColoredBox(
                    color: navy,
                    child: ContentWidth(
                      vertical: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 70,
                            runSpacing: 28,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  logo(light: true),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Des idées aux solutions digitales.',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'LIENS RAPIDES',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ...navigation
                                      .where(
                                        (n) =>
                                            n.$2 != 'realisations' &&
                                            n.$2 != 'apropos',
                                      )
                                      .map(
                                        (n) => TextButton(
                                          onPressed: () => navigate(n.$2),
                                          child: Text(
                                            n.$1,
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'PARLONS DE VOTRE PROJET',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  TextButton(
                                    onPressed: () => navigate('contact'),
                                    child: const Text(
                                      'Demander un devis  →',
                                      style: TextStyle(
                                        color: Color(0xFF83B2FF),
                                      ),
                                    ),
                                  ),
                                  if (ContactConfig.email.isNotEmpty)
                                    SelectableText(
                                      ContactConfig.email,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  if (ContactConfig.whatsapp.isNotEmpty)
                                    TextButton(
                                      onPressed: () async {
                                        final ok = await launchUrl(
                                          Uri.https(
                                            'wa.me',
                                            '/${ContactConfig.whatsapp.replaceAll(RegExp(r'\D'), '')}',
                                          ),
                                        );
                                        if (!ok && context.mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Impossible d’ouvrir WhatsApp.',
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'WhatsApp',
                                        style: TextStyle(
                                          color: Color(0xFF10B981),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Divider(color: Color(0xFF2A3F60)),
                          const SizedBox(height: 18),
                          const Text(
                            '© 2026 NOURIM PROD. Tous droits réservés.',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
