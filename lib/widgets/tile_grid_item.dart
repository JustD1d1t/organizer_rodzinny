import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/tile.dart";

class TileGridItem extends StatelessWidget {
  const TileGridItem({
    super.key,
    required this.tile,
    required this.onSelectTile,
  });

  final Tile tile;
  final void Function() onSelectTile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectTile,
      splashColor: Theme.of(context).colorScheme.onPrimaryContainer,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tile.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              tile.subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                tile.icon!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
