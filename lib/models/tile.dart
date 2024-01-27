import 'package:flutter/material.dart';

class Tile {
  Tile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.name,
  });

  final String title;
  final String subtitle;
  final Icon icon;
  final String name;
}
