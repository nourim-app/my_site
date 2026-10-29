# NOURIM PROD — Solutions Digitales

Landing page Flutter Web / Material 3 : six projets de portfolio, services, automatisation, méthode et formulaire de devis. GoRouter conserve la section dans l’URL. Maquettes conceptuelles dessinées en Flutter, aucun lien de publication supposé.

## Démarrage

```powershell
flutter pub get
flutter run -d chrome --dart-define=CONTACT_EMAIL=votre-email --dart-define=CONTACT_WHATSAPP=votre-numero-international
```

Les coordonnées sont configurées dans `lib/core/config/contact_config.dart` via `--dart-define`. Sans coordonnées, le formulaire valide la demande et propose sa copie. Avec coordonnées, une confirmation ouvre un brouillon email ou WhatsApp ; le visiteur effectue lui-même l’envoi. Aucune donnée n’est transmise à un backend.

## Vérification

```powershell
dart format .
flutter analyze
flutter test
flutter build web --release --dart-define=CONTACT_EMAIL=votre-email --dart-define=CONTACT_WHATSAPP=votre-numero-international
```

Sur Windows, si Flutter signale que les plugins nécessitent les liens symboliques, activez le mode Développeur dans les paramètres Windows, puis relancez `flutter pub get`.

## Organisation

- `lib/core/` : thème et configuration
- `lib/models/` et `lib/data/` : contenu du portfolio et des services
- `lib/widgets/` : composants, maquettes et effets
- `lib/sections/` : page et sections métier
- `assets/images/` : emplacement pour vos captures autorisées
- `assets/fonts/` : Manrope de Google Fonts et sa licence OFL

Pour remplacer un visuel, ajoutez une image dans assets/images, déclarez-la dans pubspec.yaml puis renseignez `imageAsset` dans portfolio_data.dart.

## Firebase Hosting (plus tard)

Aucun projet Firebase, backend ou secret n’est configuré ni modifié. Après avoir choisi votre projet Firebase, initialisez Hosting avec le dossier public `build/web`, puis construisez et déployez. Les URL utilisent des fragments, le rafraîchissement fonctionne sans règle de réécriture particulière. Aucun déploiement n’est effectué par ce projet.

La référence visuelle et les liens publics des applications n’ont pas été fournis. Les images actuelles sont explicitement présentées comme des concepts UI.
