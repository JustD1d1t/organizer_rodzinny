import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/recipe.dart";

class RecipeItemToShoppingList extends StatelessWidget {
  const RecipeItemToShoppingList(
      {super.key, required this.recipe, required this.addRecipe});

  final Recipe recipe;
  final Function addRecipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        title: Text(recipe.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                addRecipe(recipe);
              },
            ),
          ],
        ),
      ),
    );
  }
}
