import 'package:flutter/material.dart';

import '../models/portfolio_item.dart';

const applications = [
  PortfolioItem(
    'Rendez-vous Docteur',
    'Trouvez un médecin, consultez les disponibilités et prenez rendez-vous facilement en ligne.',
    Icons.medical_services_outlined,
    Color(0xFF1463FF),
    'Votre santé, simplement',
  ),
  PortfolioItem(
    'Inwash',
    'Réservez un lavage automobile à domicile, choisissez votre service et suivez votre réservation.',
    Icons.local_car_wash_outlined,
    Color(0xFF089EB6),
    'Un lavage, où vous voulez',
  ),
  PortfolioItem(
    'Prélèvement à domicile',
    'Réservez un prélèvement médical à domicile et suivez vos demandes simplement.',
    Icons.science_outlined,
    Color(0xFF8A62CD),
    'Vos analyses à domicile',
  ),
  PortfolioItem(
    'Course et Budget',
    'Préparez votre liste de courses, cochez vos achats et suivez vos dépenses en temps réel.',
    Icons.shopping_basket_outlined,
    Color(0xFF10A778),
    'Mes courses de la semaine',
  ),
  PortfolioItem(
    'École et Parent',
    'Suivez la scolarité de vos enfants : notes, devoirs, absences et communication avec l’école.',
    Icons.school_outlined,
    Color(0xFFDE9A32),
    'Une école, un lien',
  ),
  PortfolioItem(
    'Gestion Location Appartement',
    'Gérez vos appartements, contrats de location, locataires, paiements et documents.',
    Icons.apartment_outlined,
    Color(0xFF526AC7),
    'Votre espace immobilier',
    platform: 'Web · Mobile',
  ),
];
const services = [
  (
    'Applications Mobiles',
    'Développement d’applications Android et iOS avec Flutter.',
    Icons.phone_iphone,
    ['Android & iOS', 'Interfaces fluides', 'Solutions sur mesure'],
  ),
  (
    'Applications Web',
    'Tableaux de bord, plateformes de gestion et applications web sur mesure.',
    Icons.language,
    ['Dashboards', 'Outils de gestion', 'Design responsive'],
  ),
  (
    'IA & Automatisation',
    'Des solutions intelligentes pour simplifier vos tâches et améliorer la productivité.',
    Icons.auto_awesome,
    ['Assistants IA', 'Workflows automatisés', 'Connexion des outils'],
  ),
  (
    'Design UI/UX',
    'Des interfaces modernes, intuitives et adaptées aux utilisateurs.',
    Icons.design_services_outlined,
    ['Parcours utilisateur', 'Maquettes interactives', 'Identité visuelle'],
  ),
  (
    'Maintenance & Support',
    'Un accompagnement technique pour faire évoluer votre solution.',
    Icons.support_agent,
    ['Corrections', 'Mises à jour', 'Nouvelles fonctionnalités'],
  ),
];
