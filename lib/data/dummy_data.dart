import "package:flutter/material.dart";
import 'package:organizer_rodzinny/models/tile.dart';

final availableTiles = [
  Tile(
    icon: const Icon(Icons.list),
    title: "Listy",
    subtitle: "Lista zakupów i planów",
    name: 'list',
  ),
  Tile(
    icon: const Icon(Icons.savings),
    title: "Finanse",
    subtitle: "Budżet domowy",
    name: 'finances',
  ),
  Tile(
    icon: const Icon(Icons.flatware),
    title: "Posiłki",
    subtitle: "Zaplanuj posiłki",
    name: 'meals',
  ),
  Tile(
    icon: const Icon(Icons.receipt_long),
    title: "Przepisy",
    subtitle: "Zaplanuj przepisy",
    name: 'recipes',
  ),
  Tile(
    icon: const Icon(Icons.receipt),
    title: "Paragony",
    subtitle: "Twoje paragony",
    name: 'receipts',
  ),
  Tile(
    icon: const Icon(Icons.notes),
    title: "Notatki",
    subtitle: "Twoje notatki",
    name: 'notes',
  ),
  Tile(
    icon: const Icon(Icons.shopping_bag),
    title: "Lista zakupów",
    subtitle: "Zaplanuj zakupy",
    name: 'shopping',
  ),
  Tile(
    icon: const Icon(Icons.inventory),
    title: "Spiżarnia",
    subtitle: "Twoja spiżarnia",
    name: 'pantry',
  ),
];
