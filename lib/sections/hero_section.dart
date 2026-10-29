import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../widgets/brand_logo.dart';
import '../widgets/hero_devices.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.navigate});
  final void Function(String) navigate;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.white, Color(0xFFF5F9FF), Color(0xFFEAF3FF)],
        stops: [0, .38, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1440),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final mobile = constraints.maxWidth < 600;
            final wide = constraints.maxWidth >= 1050;
            final textScale = MediaQuery.textScalerOf(context).scale(16) / 16;
            final horizontal = mobile ? 22.0 : 40.0;
            final width = constraints.maxWidth - horizontal * 2;
            final copyWidth = wide ? (width - 24) * .45 : width;
            final titleSize = mobile
                ? 42.0
                : wide
                ? (copyWidth * .116).clamp(52.0, 68.0)
                : 58.0;
            final copy = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFFDCE8FB)),
                    boxShadow: [
                      BoxShadow(
                        color: blue.withValues(alpha: .035),
                        blurRadius: 14,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 9),
                      Flexible(
                        child: Text(
                          'DE VOTRE VISION À LA RÉALITÉ',
                          style: TextStyle(
                            fontFamily: premiumFont,
                            fontSize: mobile ? 9 : 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text.rich(
                  const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Des solutions\ndigitales pour\nconcrétiser\n',
                      ),
                      TextSpan(
                        text: 'vos idées.',
                        style: TextStyle(color: blue),
                      ),
                    ],
                  ),
                  key: const ValueKey('hero-title'),
                  style: TextStyle(
                    fontFamily: premiumFont,
                    fontSize: titleSize,
                    fontWeight: FontWeight.w800,
                    height: 1.13,
                    letterSpacing: -2.4,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 25),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 510),
                  child: const Text(
                    'Je conçois des applications mobiles, des applications web et des solutions d’intelligence artificielle et d’automatisation pour particuliers, entreprises et startups.',
                    style: TextStyle(
                      fontFamily: premiumFont,
                      fontSize: 15,
                      height: 1.85,
                      color: Color(0xFF63748E),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 18,
                  runSpacing: 12,
                  children:
                      [
                            'Design moderne',
                            'Performance',
                            'Support',
                            'Solutions sur mesure',
                          ]
                          .map(
                            (label) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE2EDFF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check_rounded,
                                    size: 11,
                                    color: blue,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  label,
                                  style: const TextStyle(
                                    fontFamily: premiumFont,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF435674),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, c) {
                    final stacked = c.maxWidth < 500 || textScale > 1.2;
                    final primary = _HeroButton(
                      primary: true,
                      label: 'Demander un devis gratuit',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: () => navigate('contact'),
                    );
                    final secondary = _HeroButton(
                      primary: false,
                      label: 'Voir mes réalisations',
                      icon: Icons.north_east_rounded,
                      onPressed: () => navigate('applications'),
                    );
                    return stacked
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              primary,
                              const SizedBox(height: 12),
                              secondary,
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(flex: 6, child: primary),
                              const SizedBox(width: 12),
                              Expanded(flex: 5, child: secondary),
                            ],
                          );
                  },
                ),
                const SizedBox(height: 22),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.handshake_outlined,
                      size: 16,
                      color: Color(0xFF8A9AB1),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'De l’idée au lancement, à vos côtés à chaque étape.',
                        style: TextStyle(
                          fontFamily: premiumFont,
                          fontSize: 10,
                          color: Color(0xFF7C8DA6),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
            final visual = Column(
              children: [
                const HeroDevices(key: ValueKey('hero-devices')),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.layers_outlined,
                      size: 13,
                      color: Color(0xFF8495AD),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Maquettes conceptuelles · Mobile, Web & IA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: premiumFont,
                          fontSize: mobile ? 8 : 10,
                          color: const Color(0xFF8495AD),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
            return Padding(
              padding: EdgeInsets.fromLTRB(
                horizontal,
                mobile ? 36 : 54,
                horizontal,
                mobile ? 36 : 60,
              ),
              child: wide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 45, child: copy),
                        const SizedBox(width: 24),
                        Expanded(flex: 55, child: visual),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        copy,
                        SizedBox(height: mobile ? 32 : 40),
                        if (!mobile)
                          Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 760),
                              child: visual,
                            ),
                          )
                        else
                          visual,
                      ],
                    ),
            );
          },
        ),
      ),
    ),
  );
}

class _HeroButton extends StatelessWidget {
  const _HeroButton({
    required this.primary,
    required this.label,
    required this.icon,
    required this.onPressed,
  });
  final bool primary;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Text(label, textAlign: TextAlign.center)),
        const SizedBox(width: 9),
        Icon(icon, size: 17),
      ],
    );
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: primary
            ? [
                BoxShadow(
                  color: blue.withValues(alpha: .19),
                  blurRadius: 22,
                  offset: const Offset(0, 9),
                ),
              ]
            : [],
      ),
      child: primary
          ? FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                minimumSize: const Size(0, 58),
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 19,
                ),
                shape: shape,
                textStyle: const TextStyle(
                  fontFamily: premiumFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: content,
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(0, 58),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 19,
                ),
                backgroundColor: Colors.white.withValues(alpha: .7),
                side: const BorderSide(color: Color(0xFFD3DFEF)),
                foregroundColor: navy,
                shape: shape,
                textStyle: const TextStyle(
                  fontFamily: premiumFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: content,
            ),
    );
  }
}
