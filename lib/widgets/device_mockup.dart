import 'package:flutter/material.dart';

import '../models/portfolio_item.dart';
import '../core/theme/app_theme.dart';

class DeviceMockup extends StatelessWidget {
  const DeviceMockup(this.item, {super.key});
  final PortfolioItem item;
  @override
  Widget build(BuildContext context) {
    final labels = switch (item.name) {
      'Rendez-vous Docteur' => [
        'Rechercher un médecin',
        'Profil du médecin',
        'Choisir un rendez-vous',
      ],
      'Inwash' => ['Lavage extérieur', 'Nettoyage intérieur', 'Ma réservation'],
      'Prélèvement à domicile' => [
        'Choisir une analyse',
        'Adresse du prélèvement',
        'Mes demandes',
      ],
      'Course et Budget' => [
        '☑ Fruits et légumes',
        '☐ Pain et céréales',
        'Total · Budget',
      ],
      'École et Parent' => [
        'Notes et devoirs',
        'Absences',
        'Messages de l’école',
      ],
      _ => [
        'Mes appartements',
        'Contrats et locataires',
        'Paiements et documents',
      ],
    };
    return Container(
      width: 160,
      height: 290,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: navy.withValues(alpha: .18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: SizedBox(
                    width: 40,
                    child: Divider(thickness: 4, height: 9, color: navy),
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Icon(item.icon, color: item.color, size: 20),
                    const Spacer(),
                    const Icon(Icons.menu, size: 14),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 78,
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: item.color.withValues(alpha: .09),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.screen,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          height: 1.2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      Icon(item.icon, color: item.color, size: 25),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ...labels.map(
                  (label) => Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 13,
                          color: item.color,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            label,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 8, height: 1.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Découvrir',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      height: 1.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardMockup extends StatelessWidget {
  const DashboardMockup({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: 390,
    height: 230,
    padding: const EdgeInsets.all(9),
    decoration: BoxDecoration(
      color: navy,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFF6F8FC),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gestion Logistique & Commerce',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Row(
            children: ['Commandes', 'Stock', 'Livraisons']
                .map(
                  (s) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.all(9),
                      color: Colors.white,
                      child: Text(s, style: const TextStyle(fontSize: 9)),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 14),
          const Text('Vue d’ensemble', style: TextStyle(fontSize: 9)),
          const SizedBox(height: 8),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                12,
                (i) => Expanded(
                  child: Container(
                    height: 22 + (i * 13 % 65).toDouble(),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: i > 7 ? blue : blue.withValues(alpha: .25),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
