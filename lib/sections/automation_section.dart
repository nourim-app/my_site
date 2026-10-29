import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../widgets/shared.dart';

const useCases = [
  (
    'Automatisation administrative',
    'Gestion des documents, extraction de données et génération de rapports.',
    Icons.description_outlined,
  ),
  (
    'Chatbots intelligents',
    'Assistants pour répondre aux questions des clients.',
    Icons.forum_outlined,
  ),
  (
    'Automatisation commerciale',
    'Suivi des prospects, commandes et notifications.',
    Icons.trending_up,
  ),
  (
    'Intégration d’outils',
    'Connexion entre applications, emails, Google Sheets, bases de données et API.',
    Icons.hub_outlined,
  ),
];

class AutomationSection extends StatelessWidget {
  const AutomationSection({super.key, required this.onContact});
  final VoidCallback onContact;
  @override
  Widget build(BuildContext context) => ContentWidth(
    child: Container(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width < 600 ? 24 : 42),
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(26),
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'IA & AUTOMATISATION',
                style: TextStyle(
                  color: Color(0xFF83B2FF),
                  fontSize: 11,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Automatisez votre activité avec l’intelligence artificielle',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Gagnez du temps, réduisez les tâches répétitives et améliorez votre organisation grâce à des solutions intelligentes.',
                style: TextStyle(color: Color(0xFFB9CAE3), height: 1.8),
              ),
              const SizedBox(height: 22),
              ...useCases.map(
                (s) => Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(s.$3, color: const Color(0xFF83B2FF), size: 22),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s.$1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              s.$2,
                              style: const TextStyle(
                                color: Color(0xFFB9CAE3),
                                height: 1.6,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FilledButton(
                onPressed: onContact,
                child: const Text('Discuter de mon projet IA  →'),
              ),
            ],
          );
          final flow = Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: .1)),
            ),
            child: Column(
              children: [
                const Text(
                  'VOTRE WORKFLOW INTELLIGENT',
                  style: TextStyle(
                    color: Color(0xFFB9CAE3),
                    fontSize: 10,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 26),
                ...List.generate(
                  4,
                  (i) => Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: i == 1 ? blue : const Color(0xFF233B60),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              [
                                Icons.edit_note,
                                Icons.auto_awesome,
                                Icons.storage,
                                Icons.mark_email_read_outlined,
                              ][i],
                              color: Colors.white,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                [
                                  'Formulaire',
                                  'Traitement IA',
                                  'Base de données',
                                  'Email / Rapport / Notification',
                                ][i],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (i < 3)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Icon(
                            Icons.south,
                            color: Color(0xFF83B2FF),
                            size: 22,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Un exemple de parcours, adapté à votre activité.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFB9CAE3), fontSize: 10),
                ),
              ],
            ),
          );
          return c.maxWidth > 780
              ? Row(
                  children: [
                    Expanded(flex: 6, child: copy),
                    const SizedBox(width: 48),
                    Expanded(flex: 4, child: flow),
                  ],
                )
              : Column(children: [copy, const SizedBox(height: 32), flow]);
        },
      ),
    ),
  );
}

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});
  @override
  Widget build(BuildContext context) => ContentWidth(
    child: Column(
      children: [
        const SectionTitle(
          'Simple, clair et collaboratif',
          'Comment ça marche ?',
          'Un parcours structuré pour donner vie à votre projet.',
        ),
        LayoutBuilder(
          builder: (context, c) {
            const steps = [
              (
                'Discussion du projet',
                'Nous échangeons sur votre idée, vos objectifs et vos besoins.',
                Icons.chat_bubble_outline,
              ),
              (
                'Analyse et proposition',
                'Je définis une solution, un périmètre et une proposition adaptés.',
                Icons.manage_search,
              ),
              (
                'Design et développement',
                'Votre solution prend forme avec des échanges à chaque étape.',
                Icons.code,
              ),
              (
                'Livraison et accompagnement',
                'Mise en ligne, prise en main et suivi de votre solution.',
                Icons.rocket_launch_outlined,
              ),
            ];
            final count = c.maxWidth > 900
                ? 4
                : c.maxWidth > 600
                ? 2
                : 1;
            return Wrap(
              spacing: 24,
              runSpacing: 28,
              children: List.generate(
                4,
                (i) => SizedBox(
                  width: (c.maxWidth - (count - 1) * 24) / count,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: pale,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(steps[i].$3, color: blue),
                          ),
                          const Spacer(),
                          Text(
                            '0${i + 1}',
                            style: const TextStyle(
                              color: Color(0xFFCEDCF0),
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        steps[i].$1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        steps[i].$2,
                        style: const TextStyle(
                          height: 1.7,
                          color: Color(0xFF60718C),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});
  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Colors.white,
    child: ContentWidth(
      child: Column(
        children: [
          const SectionTitle(
            'NOURIM PROD · Solutions Digitales',
            'Pourquoi nous choisir ?',
            'Un interlocuteur pour concevoir une solution qui vous ressemble.',
          ),
          LayoutBuilder(
            builder: (context, c) => Wrap(
              spacing: 24,
              runSpacing: 24,
              children:
                  [
                        ('Solutions personnalisées', Icons.tune),
                        ('Design professionnel', Icons.draw_outlined),
                        ('Technologies modernes', Icons.layers_outlined),
                        ('Accompagnement et support', Icons.handshake_outlined),
                      ]
                      .map(
                        (s) => SizedBox(
                          width: c.maxWidth > 900
                              ? (c.maxWidth - 72) / 4
                              : (c.maxWidth - 24) / 2,
                          child: Column(
                            children: [
                              Icon(s.$2, color: blue, size: 30),
                              const SizedBox(height: 14),
                              Text(
                                s.$1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    ),
  );
}
