import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:organizer_rodzinny/data/dummy_data.dart';
import 'package:organizer_rodzinny/screens/finances/finances_screen.dart';
import 'package:organizer_rodzinny/screens/lists/lists_screen.dart';
import 'package:organizer_rodzinny/screens/meals/meals_screen.dart';
import 'package:organizer_rodzinny/screens/notes/notes_screen.dart';
import 'package:organizer_rodzinny/screens/pantry/pantry_screen.dart';
import "package:organizer_rodzinny/screens/receipts/receipts_screen.dart";
import 'package:organizer_rodzinny/screens/recipes/recipes_screen.dart';
import 'package:organizer_rodzinny/screens/shopping/shopping_screen.dart';
import 'package:organizer_rodzinny/widgets/tile_grid_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> widgetList = [
    ListsScreen(),
    FinancesScreen(),
    MealsScreen(),
    RecipesScreen(),
    ReceiptsScreen(),
    NotesScreen(),
    ShoppingScreen(),
    PantryScreen(),
  ];
  void _selectTile(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => widgetList[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Organizer rodzinny",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ]
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...availableTiles.asMap().entries.map((entry) {
            final index = entry.key;
            final tile = entry.value;
            return TileGridItem(
              tile: tile,
              onSelectTile: () {
                _selectTile(context, index);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
