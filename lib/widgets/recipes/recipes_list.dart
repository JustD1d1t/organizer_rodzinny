import "package:flutter/material.dart";
import 'package:organizer_rodzinny/models/recipe.dart';
import "package:organizer_rodzinny/widgets/recipes/recipe_item.dart";

class RecipesList extends StatelessWidget {
  const RecipesList(
      {super.key, required this.recipes, required this.onRemoveMeal});

  final List<Recipe> recipes;
  final Function(Recipe) onRemoveMeal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 8.0,
      ),
      child: ListView.separated(
        itemCount: recipes.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) => onRemoveMeal(recipes[index]),
          key: ValueKey(recipes[index].id),
          child: RecipeItem(recipe: recipes[index]),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
