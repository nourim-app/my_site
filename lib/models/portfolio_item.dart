import 'package:flutter/material.dart';

class PortfolioItem {
  const PortfolioItem(
    this.name,
    this.description,
    this.icon,
    this.color,
    this.screen, {
    this.platform = 'Android · iOS',
    this.imageAsset,
  });
  final String name, description, screen, platform;
  final IconData icon;
  final Color color;
  final String? imageAsset;
}
