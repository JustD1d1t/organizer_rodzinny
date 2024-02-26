import "package:flutter/material.dart";
import 'package:organizer_rodzinny/models/recipe.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key, required this.recipe});

  static const id = "recipe_details_screen";

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (recipe.description != null)
              Text(
                recipe.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Składniki",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ...recipe.ingredients.map(
              (ingredient) => ListTile(
                title: Text(ingredient.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (ingredient.amount != null)
                      Text(
                        ingredient.amount! % 1 == 0
                            ? ingredient.amount!.toInt().toString()
                            : ingredient.amount!.toStringAsFixed(2),
                      ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (ingredient.unit != null)
                      Text(
                        ingredient.unit!,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Kroki",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ...recipe.steps!.map(
              (step) => ListTile(
                leading: const Icon(Icons.arrow_right),
                title: Text(step),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
