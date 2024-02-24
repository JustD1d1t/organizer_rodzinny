import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/Ingredient.dart";
import "package:organizer_rodzinny/models/recipe.dart";
import "package:organizer_rodzinny/widgets/shopping_list/shopping_list_single_recipe_ingredient.dart";

class ShoppingListReceipeIngredients extends StatefulWidget {
  const ShoppingListReceipeIngredients({
    super.key,
    required this.appBarTitle,
    required this.recipe,
  });
  final Recipe? recipe;
  final String appBarTitle;

  @override
  State<ShoppingListReceipeIngredients> createState() =>
      _ShoppingListReceipeIngredientsState();
}

class _ShoppingListReceipeIngredientsState
    extends State<ShoppingListReceipeIngredients> {
  void removeIngredient(ShoppingRecipeIngredient ingredient) {
    final itemIndex = widget.recipe!.ingredients.indexOf(ingredient);
    setState(() {
      widget.recipe!.ingredients.remove(ingredient);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${ingredient.name} usunięte'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Cofnij',
          onPressed: () {
            setState(() {
              widget.recipe!.ingredients.insert(
                itemIndex,
                ingredient,
              );
            });
          },
        ),
      ),
    );
  }

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

    if (widget.recipe!.ingredients.isNotEmpty) {
      content = ListView.separated(
        itemCount: widget.recipe!.ingredients.length,
        itemBuilder: (context, index) => ShoppingListSingleRecipeIngredient(
          ingredient: widget.recipe!.ingredients[index],
          onRemoveItem: removeIngredient,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: Padding(padding: const EdgeInsets.all(8), child: content),
    );
  }
}
