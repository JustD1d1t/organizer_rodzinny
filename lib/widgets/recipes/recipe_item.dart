import "package:flutter/material.dart";
import 'package:organizer_rodzinny/models/recipe.dart';
import 'package:organizer_rodzinny/screens/recipes/recipe_details_screen.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  void openRecipeDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RecipeDetails(recipe: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          openRecipeDetails(context);
        },
        child: ListTile(
            title: Text(recipe.name),
            subtitle: recipe.description != null ? Text(recipe.description!) : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  iconSize: 16,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  iconSize: 16,
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }
}
