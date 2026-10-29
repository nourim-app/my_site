import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/config/contact_config.dart';
import '../widgets/shared.dart';

String encodeRequest(
  String name,
  String email,
  String phone,
  String project,
  String budget,
  String description,
) =>
    'Nom : $name\nEmail : $email\nTéléphone : $phone\nType de projet : $project\nBudget : ${budget.isEmpty ? "Non précisé" : budget}\n\n$description';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});
  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final form = GlobalKey<FormState>();
  final fields = List.generate(5, (_) => TextEditingController());
  String? project;
  bool busy = false;
  @override
  void dispose() {
    for (final c in fields) {
      c.dispose();
    }
    super.dispose();
  }

  String? requiredField(String? s) =>
      s == null || s.trim().isEmpty ? 'Veuillez renseigner ce champ.' : null;
  Future<void> submit() async {
    if (!form.currentState!.validate()) return;
    final message = encodeRequest(
      fields[0].text.trim(),
      fields[1].text.trim(),
      fields[2].text.trim(),
      project!,
      fields[3].text.trim(),
      fields[4].text.trim(),
    );
    final configured =
        ContactConfig.email.isNotEmpty || ContactConfig.whatsapp.isNotEmpty;
    final channel = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          configured ? 'Vérifier votre demande' : 'Votre demande est prête',
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              const SizedBox(height: 20),
              Text(
                configured
                    ? 'Choisissez un canal pour ouvrir votre message. Vous pourrez le vérifier avant de l’envoyer.'
                    : 'Les coordonnées de contact ne sont pas encore disponibles. Vous pouvez copier votre demande ; aucun message n’a été envoyé.',
                style: const TextStyle(fontSize: 12, color: Color(0xFF60718C)),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'copy'),
            child: const Text('Copier'),
          ),
          if (ContactConfig.email.isNotEmpty)
            FilledButton(
              onPressed: () => Navigator.pop(context, 'email'),
              child: const Text('Ouvrir mon email'),
            ),
          if (ContactConfig.whatsapp.isNotEmpty)
            FilledButton(
              onPressed: () => Navigator.pop(context, 'whatsapp'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
              ),
              child: const Text('WhatsApp'),
            ),
        ],
      ),
    );
    if (channel == null || !mounted) return;
    if (channel == 'copy') {
      await Clipboard.setData(ClipboardData(text: message));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Demande copiée. Aucun message envoyé.'),
          ),
        );
      }
      return;
    }
    setState(() => busy = true);
    try {
      final uri = channel == 'email'
          ? Uri.parse(
              'mailto:${ContactConfig.email}?subject=${Uri.encodeComponent('Demande de devis — $project')}&body=${Uri.encodeComponent(message)}',
            )
          : Uri.https(
              'wa.me',
              '/${ContactConfig.whatsapp.replaceAll(RegExp(r'\D'), '')}',
              {'text': message},
            );
      if (!await launchUrl(uri)) {
        throw Exception('launch failed');
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Impossible d’ouvrir cette application. Réessayez ou copiez votre demande.',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => ContentWidth(
    child: Column(
      children: [
        const SectionTitle(
          'Construisons votre prochaine solution',
          'Vous avez un projet ? Parlons-en !',
          'Présentez-moi votre idée et réunissons les détails nécessaires pour préparer une solution adaptée.',
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: HoverCard(
            child: Form(
              key: form,
              child: LayoutBuilder(
                builder: (context, c) {
                  Widget field(
                    int i,
                    String label, {
                    TextInputType? keyboard,
                    String? Function(String?)? validator,
                    int lines = 1,
                  }) => TextFormField(
                    controller: fields[i],
                    decoration: InputDecoration(
                      labelText: label,
                      alignLabelWithHint: true,
                    ),
                    keyboardType: keyboard,
                    minLines: lines,
                    maxLines: lines,
                    validator: validator ?? requiredField,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  );
                  final inputs = [
                    field(0, 'Nom complet', keyboard: TextInputType.name),
                    field(
                      1,
                      'Email',
                      keyboard: TextInputType.emailAddress,
                      validator: (s) =>
                          RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$')
                              .hasMatch(s?.trim() ?? '')
                          ? null
                          : 'Saisissez un email valide.',
                    ),
                    field(
                      2,
                      'Téléphone',
                      keyboard: TextInputType.phone,
                      validator: (s) =>
                          RegExp(r'^\+?[\d\s().-]{7,20}$')
                              .hasMatch(s?.trim() ?? '')
                          ? null
                          : 'Saisissez un numéro valide.',
                    ),
                    DropdownButtonFormField<String>(
                      initialValue: project,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Type de projet',
                      ),
                      items:
                          [
                                'Application Mobile',
                                'Application Web',
                                'IA & Automatisation',
                                'Maintenance',
                                'Autre',
                              ]
                              .map(
                                (s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(
                                    s,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (v) => setState(() => project = v),
                      validator: requiredField,
                    ),
                  ];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Wrap(
                        spacing: 18,
                        runSpacing: 20,
                        children: inputs
                            .map(
                              (w) => SizedBox(
                                width: c.maxWidth > 550
                                    ? (c.maxWidth - 18) / 2
                                    : c.maxWidth,
                                child: w,
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      field(
                        3,
                        'Budget estimatif (optionnel)',
                        validator: (_) => null,
                      ),
                      const SizedBox(height: 20),
                      field(
                        4,
                        'Description du projet',
                        lines: 5,
                        keyboard: TextInputType.multiline,
                        validator: (s) => (s?.trim().length ?? 0) < 15
                            ? 'Décrivez votre projet en au moins 15 caractères.'
                            : null,
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: busy ? null : submit,
                        child: Text(
                          busy ? 'Ouverture…' : 'Envoyer ma demande  →',
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Votre demande reste sur votre appareil jusqu’à son envoi par email ou WhatsApp.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF71819A),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
