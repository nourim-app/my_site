import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/device_mockup.dart';
import '../widgets/shared.dart';

class ApplicationsSection extends StatelessWidget {
  const ApplicationsSection({super.key});
  @override
  Widget build(BuildContext context) => ContentWidth(
    child: Column(
      children: [
        const SectionTitle(
          'Des idées aux applications',
          'Nos applications',
          'Des solutions concrètes pour simplifier votre quotidien.',
        ),
        ResponsiveGrid(
          children: applications
              .map(
                (item) => HoverCard(
                  child: SizedBox(
                    height: 570,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: item.color.withValues(alpha: .07),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: item.imageAsset != null
                              ? Image.asset(
                                  item.imageAsset!,
                                  fit: BoxFit.contain,
                                )
                              : Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      right: -25,
                                      top: -25,
                                      child: Icon(
                                        item.icon,
                                        size: 170,
                                        color: item.color.withValues(
                                          alpha: .055,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 12,
                                      top: 12,
                                      child: Text(
                                        'CONCEPT UI',
                                        style: TextStyle(
                                          fontSize: 9,
                                          letterSpacing: 1.3,
                                          color: Color(0xFF60718C),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 25,
                                      child: Transform.rotate(
                                        angle: -.05,
                                        child: DeviceMockup(item),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          item.platform,
                          style: TextStyle(
                            color: item.color,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: .8,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.description,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.7,
                            color: Color(0xFF60718C),
                          ),
                        ),
                        const Spacer(),
                        const Divider(color: pale),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 14,
                              color: Color(0xFF60718C),
                            ),
                            SizedBox(width: 7),
                            Expanded(
                              child: Text(
                                'Présentation disponible sur demande',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF60718C),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 22),
        const Text(
          'Projets de portfolio · Les maquettes illustrent les concepts et ne présument pas de leur publication.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: Color(0xFF71819A)),
        ),
      ],
    ),
  );
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});
  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Colors.white,
    child: ContentWidth(
      child: Column(
        children: [
          const SectionTitle(
            'Une expertise, plusieurs possibilités',
            'Nos services',
            'La bonne solution, pensée pour vos besoins.',
          ),
          ResponsiveGrid(
            children: services
                .map(
                  (s) => HoverCard(
                    color: const Color(0xFFFAFCFF),
                    child: SizedBox(
                      height: 380,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: pale,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(s.$3, color: blue),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            s.$1,
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            s.$2,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.6,
                              color: Color(0xFF60718C),
                            ),
                          ),
                          const Spacer(),
                          ...s.$4.map(
                            (p) => Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check,
                                    color: blue,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      p,
                                      style: const TextStyle(fontSize: 12),
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
                )
                .toList(),
          ),
        ],
      ),
    ),
  );
}
