import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/recipe.dart";

class ShoppingListReceipeIngredients extends StatelessWidget {
  const ShoppingListReceipeIngredients({
    super.key,
    required this.appBarTitle,
    required this.recipe,
  });
  final ShoppingRecipeItem recipe;
  final String appBarTitle;

  static const id = "shopping_list_receipe_ingredients";

  @override
  Widget build(BuildContext context) {
    Widget content = const Column(
      children: [
        Text(
          "Ingredients",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    // if (widget.recipe.ingredients.isNotEmpty) {
    //   content = ListView.separated(
    //     itemCount: widget.recipe.ingredients.length,
    //     itemBuilder: (context, index) => ShoppingListSingleRecipeIngredient(
    //       ingredient: widget.recipe.ingredients[index],
    //       recipe: widget.recipe,
    //     ),
    //     separatorBuilder: (context, index) => const SizedBox(
    //       height: 10,
    //     ),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(padding: const EdgeInsets.all(8), child: content),
    );
  }
}
