import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'brand_logo.dart';

// Fixed design coordinates are scaled together, preserving device proportions.
// These interfaces illustrate concepts, rather than claiming published products.
class HeroDevices extends StatelessWidget {
  const HeroDevices({super.key});
  @override
  Widget build(BuildContext context) => MediaQuery.withNoTextScaling(
    child: Semantics(
      image: true,
      label: 'Maquettes conceptuelles : trois smartphones Inwash, Rendez-vous Docteur et Course et Budget, et un ordinateur de gestion logistique.',
      child: ExcludeSemantics(
        child: AspectRatio(
          aspectRatio: 760 / 720,
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: 760,
              height: 720,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 70,
                    top: 60,
                    child: Container(
                      width: 610,
                      height: 540,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFFC5DCFF).withValues(alpha: .65),
                            const Color(0xFFEAF3FF).withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 125,
                    top: 100,
                    child: Container(
                      width: 480,
                      height: 480,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blue.withValues(alpha: .08)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 165,
                    top: 140,
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blue.withValues(alpha: .06)),
                      ),
                    ),
                  ),
                  const Positioned(left: 88, top: 46, child: _Laptop()),
                  Positioned(
                    left: 42,
                    top: 252,
                    child: Transform.rotate(
                      angle: -.12,
                      child: const _Phone(kind: 0),
                    ),
                  ),
                  Positioned(
                    right: 44,
                    top: 275,
                    child: Transform.rotate(
                      angle: .12,
                      child: const _Phone(kind: 2),
                    ),
                  ),
                  const Positioned(
                    left: 278,
                    top: 262,
                    child: _Phone(kind: 1, prominent: true),
                  ),
                  Positioned(
                    left: 26,
                    top: 192,
                    child: _FloatingLabel(
                      icon: Icons.flutter_dash,
                      title: 'Mobile & Web',
                      subtitle: 'Un écosystème connecté',
                      color: blue,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 139,
                    child: _FloatingLabel(
                      icon: Icons.auto_awesome_rounded,
                      title: 'Pensé pour vous',
                      subtitle: 'Design · Code · Intelligence',
                      color: const Color(0xFF7857D8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _FloatingLabel extends StatelessWidget {
  const _FloatingLabel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final IconData icon;
  final String title, subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE8EFFA)),
      boxShadow: [
        BoxShadow(
          color: navy.withValues(alpha: .07),
          blurRadius: 28,
          offset: const Offset(0, 12),
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                height: 1.5,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 8,
                color: Color(0xFF7B8AA2),
                height: 1.8,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _Phone extends StatelessWidget {
  const _Phone({required this.kind, this.prominent = false});
  final int kind;
  final bool prominent;
  @override
  Widget build(BuildContext context) => Container(
    width: prominent ? 202 : 188,
    height: prominent ? 420 : 406,
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(34),
      gradient: const LinearGradient(
        colors: [
          Color(0xFFA6B4C8),
          Color(0xFF26354A),
          Color(0xFF73849A),
          Color(0xFFD5DFEA),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: navy.withValues(alpha: prominent ? .26 : .18),
          blurRadius: 36,
          offset: const Offset(5, 24),
        ),
        BoxShadow(
          color: Colors.white.withValues(alpha: .8),
          blurRadius: 1,
          offset: const Offset(-1, -1),
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF101A2B),
        borderRadius: BorderRadius.circular(31),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: ColoredBox(
          color: const Color(0xFFF8FAFD),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      color: Colors.white,
                      child: const Row(
                        children: [
                          Text(
                            '9:41',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.signal_cellular_alt, size: 9),
                          SizedBox(width: 3),
                          Icon(Icons.wifi, size: 9),
                          SizedBox(width: 3),
                          Icon(Icons.battery_full, size: 11),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: kind == 0
                            ? const _WashScreen()
                            : kind == 1
                            ? const _DoctorScreen()
                            : const _BudgetScreen(),
                      ),
                    ),
                    _PhoneNavigation(
                      color: kind == 0
                          ? const Color(0xFF089EB6)
                          : kind == 1
                          ? blue
                          : const Color(0xFF10A778),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 7,
                left: prominent ? 66 : 59,
                child: Container(
                  width: 56,
                  height: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xFF101A2B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Positioned(
                bottom: 5,
                left: 63,
                right: 63,
                child: SizedBox(
                  height: 3,
                  child: ColoredBox(color: Color(0xFF1F2937)),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Text _screenText(
  String text, {
  double size = 10,
  Color color = navy,
  FontWeight weight = FontWeight.w600,
  int lines = 2,
}) => Text(
  text,
  maxLines: lines,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(
    fontFamily: premiumFont,
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: 1.35,
  ),
);

class _WashScreen extends StatelessWidget {
  const _WashScreen();
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Row(
        children: [
          _screenText(
            'inwash',
            size: 19,
            color: const Color(0xFF089EB6),
            weight: FontWeight.w800,
          ),
          const Spacer(),
          const Icon(Icons.notifications_none, size: 15),
        ],
      ),
      const SizedBox(height: 13),
      _screenText(
        'Un véhicule propre,\nsans vous déplacer.',
        size: 14,
        weight: FontWeight.w800,
      ),
      const SizedBox(height: 9),
      Container(
        height: 58,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFDBF5FA), Color(0xFFBFE5F3)],
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const CustomPaint(
          painter: _CarPainter(),
          child: SizedBox.expand(),
        ),
      ),
      const SizedBox(height: 12),
      _screenText(
        'Choisissez votre service',
        size: 10,
        weight: FontWeight.w800,
      ),
      const SizedBox(height: 8),
      ...[
        (Icons.water_drop_outlined, 'Lavage extérieur', 'À votre domicile'),
        (
          Icons.cleaning_services_outlined,
          'Nettoyage complet',
          'Intérieur & extérieur',
        ),
      ].map(
        (s) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5EDF3)),
            ),
            child: Row(
              children: [
                Icon(s.$1, color: const Color(0xFF089EB6), size: 19),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _screenText(s.$2, size: 8),
                      _screenText(
                        s.$3,
                        size: 6,
                        color: const Color(0xFF8191A6),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, size: 12),
              ],
            ),
          ),
        ),
      ),
      const Spacer(),
      const _MiniButton('Réserver un lavage', color: Color(0xFF089EB6)),
      const SizedBox(height: 8),
    ],
  );
}

class _DoctorScreen extends StatelessWidget {
  const _DoctorScreen();
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Row(
        children: [
          const Icon(Icons.add_box_rounded, size: 20, color: blue),
          const SizedBox(width: 5),
          _screenText('Rendez-vous\nDocteur', size: 9, weight: FontWeight.w800),
          const Spacer(),
          const CircleAvatar(
            radius: 11,
            backgroundColor: pale,
            child: Icon(Icons.person_outline, size: 14, color: blue),
          ),
        ],
      ),
      const SizedBox(height: 15),
      _screenText(
        'Prenez soin\nde votre santé.',
        size: 17,
        weight: FontWeight.w800,
      ),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: const Color(0xFFE3EAF5)),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, size: 12, color: Color(0xFF8191A6)),
            const SizedBox(width: 5),
            _screenText(
              'Médecin, spécialité…',
              size: 7,
              color: const Color(0xFF8191A6),
            ),
          ],
        ),
      ),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: pale,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 53,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD3E4FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const CustomPaint(painter: _DoctorPortraitPainter()),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _screenText(
                        'Votre médecin',
                        size: 9,
                        weight: FontWeight.w800,
                      ),
                      _screenText(
                        'Médecine générale',
                        size: 7,
                        color: const Color(0xFF60718C),
                      ),
                      const SizedBox(height: 5),
                      _screenText(
                        '● Sur rendez-vous',
                        size: 6,
                        color: const Color(0xFF10A778),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            const Divider(height: 1, color: Color(0xFFD2E0F5)),
            const SizedBox(height: 9),
            Row(
              children: ['Lun', 'Mar', 'Mer', 'Jeu']
                  .asMap()
                  .entries
                  .map(
                    (e) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          color: e.key == 1 ? blue : Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          e.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w700,
                            color: e.key == 1 ? Colors.white : navy,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      const Spacer(),
      const _MiniButton('Prendre rendez-vous'),
      const SizedBox(height: 8),
    ],
  );
}

class _BudgetScreen extends StatelessWidget {
  const _BudgetScreen();
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Row(
        children: [
          const Icon(
            Icons.shopping_basket_rounded,
            color: Color(0xFF10A778),
            size: 20,
          ),
          const SizedBox(width: 6),
          _screenText('Course & Budget', size: 10, weight: FontWeight.w800),
        ],
      ),
      const SizedBox(height: 17),
      _screenText(
        'Mes courses,\nl’esprit tranquille.',
        size: 15,
        weight: FontWeight.w800,
      ),
      const SizedBox(height: 12),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF149E7D), Color(0xFF08785F)],
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _screenText(
              'BUDGET DE LA SEMAINE',
              size: 6,
              color: const Color(0xFFB5E8D9),
            ),
            const SizedBox(height: 5),
            _screenText(
              '240,00 DH',
              size: 19,
              color: Colors.white,
              weight: FontWeight.w800,
            ),
            const SizedBox(height: 9),
            const LinearProgressIndicator(
              value: .62,
              minHeight: 4,
              color: Color(0xFF9EE8CB),
              backgroundColor: Color(0xFF369A7C),
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            const SizedBox(height: 5),
            _screenText(
              'Exemple de suivi du budget',
              size: 6,
              color: Colors.white70,
            ),
          ],
        ),
      ),
      const SizedBox(height: 13),
      _screenText('Ma liste de courses', size: 10, weight: FontWeight.w800),
      const SizedBox(height: 6),
      ...[
        ('Fruits & légumes', '45 DH', true),
        ('Pain & céréales', '30 DH', true),
        ('Produits laitiers', '35 DH', false),
      ].map(
        (p) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Icon(
                p.$3
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                color: p.$3 ? const Color(0xFF10A778) : const Color(0xFFB9C9D3),
                size: 13,
              ),
              const SizedBox(width: 5),
              Expanded(child: _screenText(p.$1, size: 7)),
              _screenText(p.$2, size: 7),
            ],
          ),
        ),
      ),
      const Spacer(),
      const SizedBox(height: 5),
    ],
  );
}

class _MiniButton extends StatelessWidget {
  const _MiniButton(this.label, {this.color = blue});
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(9),
    ),
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: premiumFont,
        fontSize: 8,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

class _PhoneNavigation extends StatelessWidget {
  const _PhoneNavigation({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    height: 36,
    margin: const EdgeInsets.only(bottom: 8),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          [
                Icons.home_rounded,
                Icons.calendar_month_outlined,
                Icons.favorite_border_rounded,
                Icons.person_outline_rounded,
              ]
              .asMap()
              .entries
              .map(
                (e) => Icon(
                  e.value,
                  size: 15,
                  color: e.key == 0 ? color : const Color(0xFF9AA7B8),
                ),
              )
              .toList(),
    ),
  );
}

class _Laptop extends StatelessWidget {
  const _Laptop();
  @override
  Widget build(BuildContext context) => SizedBox(
    width: 610,
    height: 365,
    child: Stack(
      children: [
        Positioned(
          left: 28,
          top: 0,
          right: 28,
          bottom: 26,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF98A9BD),
                  Color(0xFF26354B),
                  Color(0xFFC1CDD9),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: navy.withValues(alpha: .18),
                  blurRadius: 40,
                  offset: const Offset(5, 20),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 14, 10, 13),
              decoration: BoxDecoration(
                color: const Color(0xFF152136),
                borderRadius: BorderRadius.circular(17),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: const _LogisticsScreen(),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 303,
          child: Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Color(0xFF54708A),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 32,
            child: CustomPaint(painter: _LaptopBasePainter()),
          ),
        ),
      ],
    ),
  );
}

class _LogisticsScreen extends StatelessWidget {
  const _LogisticsScreen();
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 94,
        color: navy,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            _screenText(
              'N / GESTION',
              size: 9,
              color: Colors.white,
              weight: FontWeight.w800,
            ),
            const SizedBox(height: 25),
            ...[
              'Vue d’ensemble',
              'Commandes',
              'Inventaire',
              'Livraisons',
              'Documents',
            ].asMap().entries.map(
              (e) => Container(
                margin: const EdgeInsets.only(bottom: 11),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                decoration: BoxDecoration(
                  color: e.key == 0 ? blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(
                      [
                        Icons.dashboard_outlined,
                        Icons.shopping_bag_outlined,
                        Icons.inventory_2_outlined,
                        Icons.local_shipping_outlined,
                        Icons.description_outlined,
                      ][e.key],
                      size: 9,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _screenText(
                        e.value,
                        size: 5.5,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            _screenText(
              'LOGISTIQUE & COMMERCE',
              size: 5,
              color: Colors.white54,
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          color: const Color(0xFFF5F7FC),
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _screenText(
                    'Tableau de bord',
                    size: 14,
                    weight: FontWeight.w800,
                  ),
                  const Spacer(),
                  _screenText(
                    'Aperçu de démonstration',
                    size: 6,
                    color: const Color(0xFF8191A6),
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 9,
                    backgroundColor: pale,
                    child: Icon(Icons.person_outline, size: 12, color: blue),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              _screenText(
                'Une vue claire de votre activité.',
                size: 7,
                color: const Color(0xFF8191A6),
              ),
              const SizedBox(height: 16),
              Row(
                children:
                    [
                          (
                            'Commandes',
                            '128',
                            blue,
                            Icons.shopping_bag_outlined,
                          ),
                          (
                            'Produits en stock',
                            '846',
                            const Color(0xFF10A778),
                            Icons.inventory_2_outlined,
                          ),
                          (
                            'Livraisons',
                            '24',
                            const Color(0xFF9C6ADB),
                            Icons.local_shipping_outlined,
                          ),
                        ]
                        .map(
                          (s) => Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: const Color(0xFFE9EEF7),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      _screenText(
                                        s.$1,
                                        size: 6,
                                        color: const Color(0xFF8191A6),
                                      ),
                                      const Spacer(),
                                      Icon(s.$4, color: s.$3, size: 12),
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  _screenText(
                                    s.$2,
                                    size: 18,
                                    weight: FontWeight.w800,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _screenText(
                            'Évolution de l’activité',
                            size: 8,
                            weight: FontWeight.w800,
                          ),
                          const Spacer(),
                          _screenText(
                            'Données illustratives',
                            size: 5,
                            color: const Color(0xFF8191A6),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Expanded(
                        child: CustomPaint(
                          painter: _ChartPainter(),
                          child: SizedBox.expand(),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']
                                .map(
                                  (s) => _screenText(
                                    s,
                                    size: 5,
                                    color: const Color(0xFF8191A6),
                                  ),
                                )
                                .toList(),
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
  );
}

class _ChartPainter extends CustomPainter {
  const _ChartPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = const Color(0xFFEDF1F8)
      ..strokeWidth = 1;
    for (var i = 0; i < 4; i++) {
      final y = size.height * i / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    final points = [0.75, .6, .69, .32, .41, .18, .08];
    final line = Path()..moveTo(0, size.height * points[0]);
    for (var i = 1; i < points.length; i++) {
      final x = size.width * i / (points.length - 1);
      final px = size.width * (i - 1) / (points.length - 1);
      line.cubicTo(
        (x + px) / 2,
        size.height * points[i - 1],
        (x + px) / 2,
        size.height * points[i],
        x,
        size.height * points[i],
      );
    }
    final area = Path.from(line)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      area,
      Paint()
        ..shader = const LinearGradient(
          colors: [Color(0x331463FF), Color(0x001463FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.4
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LaptopBasePainter extends CustomPainter {
  const _LaptopBasePainter();
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(28, 0)
      ..lineTo(size.width - 28, 0)
      ..lineTo(size.width, 18)
      ..quadraticBezierTo(size.width, 29, size.width - 24, 31)
      ..lineTo(24, 31)
      ..quadraticBezierTo(0, 29, 0, 18)
      ..close();
    canvas.drawPath(
      path,
      Paint()
        ..shader = const LinearGradient(
          colors: [
            Color(0xFFE8EEF5),
            Color(0xFFA8B7C8),
            Color(0xFFCAD4E0),
            Color(0xFF8B9DAF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(Offset.zero & size),
    );
    canvas.drawLine(
      const Offset(1, 18),
      Offset(size.width - 1, 18),
      Paint()
        ..color = const Color(0xFFF2F6FB)
        ..strokeWidth = 1,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * .4, 0, size.width * .2, 7),
        const Radius.circular(4),
      ),
      Paint()..color = const Color(0xFF95A7BA),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CarPainter extends CustomPainter {
  const _CarPainter();
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 140, size.height / 75);
    canvas.drawOval(
      const Rect.fromLTWH(13, 55, 118, 12),
      Paint()
        ..color = navy.withValues(alpha: .12)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5),
    );
    final body = Path()
      ..moveTo(8, 45)
      ..lineTo(21, 36)
      ..lineTo(38, 14)
      ..quadraticBezierTo(42, 10, 52, 10)
      ..lineTo(93, 10)
      ..lineTo(116, 33)
      ..lineTo(132, 38)
      ..quadraticBezierTo(139, 39, 139, 48)
      ..lineTo(136, 58)
      ..lineTo(7, 58)
      ..close();
    canvas.drawPath(
      body,
      Paint()
        ..shader = const LinearGradient(
          colors: [Color(0xFFFEFFFF), Color(0xFFC0D5E5), Color(0xFF8CA9BF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(const Rect.fromLTWH(0, 10, 140, 50)),
    );
    canvas.drawPath(
      Path()
        ..moveTo(43, 16)
        ..lineTo(62, 16)
        ..lineTo(62, 33)
        ..lineTo(30, 33)
        ..close(),
      Paint()..color = const Color(0xFF355A75),
    );
    canvas.drawPath(
      Path()
        ..moveTo(68, 16)
        ..lineTo(91, 16)
        ..lineTo(108, 33)
        ..lineTo(68, 33)
        ..close(),
      Paint()..color = const Color(0xFF355A75),
    );
    for (final x in [31.0, 111.0]) {
      canvas.drawCircle(
        Offset(x, 56),
        12,
        Paint()..color = const Color(0xFF203348),
      );
      canvas.drawCircle(
        Offset(x, 56),
        7,
        Paint()..color = const Color(0xFF91A7BA),
      );
      canvas.drawCircle(
        Offset(x, 56),
        3,
        Paint()..color = const Color(0xFFDCE8F0),
      );
    }
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(122, 39, 12, 5),
        const Radius.circular(2),
      ),
      Paint()..color = Colors.white,
    );
    for (var i = 0; i < 3; i++) {
      canvas.drawCircle(
        Offset(19 + i * 10, 9 - i * 3),
        2.5,
        Paint()..color = Colors.white.withValues(alpha: .8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DoctorPortraitPainter extends CustomPainter {
  const _DoctorPortraitPainter();
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 48, size.height / 53);
    canvas.drawOval(
      const Rect.fromLTWH(5, 33, 39, 45),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      const Rect.fromLTWH(20, 28, 9, 10),
      Paint()..color = const Color(0xFFE8BCA6),
    );
    canvas.drawOval(
      const Rect.fromLTWH(14, 8, 22, 27),
      Paint()..color = const Color(0xFFF1C9B2),
    );
    canvas.drawPath(
      Path()
        ..moveTo(13, 19)
        ..quadraticBezierTo(8, 1, 27, 4)
        ..quadraticBezierTo(40, 4, 36, 23)
        ..lineTo(33, 13)
        ..quadraticBezierTo(24, 18, 17, 13)
        ..close(),
      Paint()..color = const Color(0xFF35435B),
    );
    canvas.drawPath(
      Path()
        ..moveTo(19, 34)
        ..lineTo(24, 42)
        ..lineTo(29, 34)
        ..lineTo(29, 53)
        ..lineTo(19, 53)
        ..close(),
      Paint()..color = blue,
    );
    canvas.drawArc(
      const Rect.fromLTWH(12, 35, 22, 15),
      0,
      math.pi,
      false,
      Paint()
        ..color = const Color(0xFF60718C)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
