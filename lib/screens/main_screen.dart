import "package:flutter/material.dart";
import 'package:organizer_rodzinny/data/dummy_data.dart';
import 'package:organizer_rodzinny/models/tile.dart';
import 'package:organizer_rodzinny/screens/lists/lists_screen.dart';
import 'package:organizer_rodzinny/widgets/tile_grid_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _selectTile(BuildContext context, Tile tile) {
    final pageName = tile.name;
    if (pageName == 'list') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const ListsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Organizer rodzinny",
          style: Theme.of(context).textTheme.titleMedium,
        ),
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
          for (final tile in availableTiles)
            TileGridItem(
              tile: tile,
              onSelectTile: () {
                _selectTile(context, tile);
              },
            )
        ],
      ),
    );
  }
}
