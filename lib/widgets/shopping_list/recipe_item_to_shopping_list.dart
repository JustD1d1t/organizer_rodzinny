import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/recipe.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";

class RecipeItemToShoppingList extends StatelessWidget {
  const RecipeItemToShoppingList(
      {super.key,
      required this.recipe,
      required this.addRecipe,
      required this.shoppingList});

  final Recipe recipe;
  final Function addRecipe;
  final ShoppingList shoppingList;

  void addRecipeToShoppingList(BuildContext context, Recipe recipe) {
    context.read<ShoppingListBloc>().add(
          AddRecipeToShoppingList(
            shoppingRecipeItem: ShoppingRecipeItem(
              name: recipe.name,
              ingredients: recipe.ingredients,
              description: recipe.description,
              steps: recipe.steps,
              checked: false,
            ),
            shoppingList: shoppingList,
          ),
        );
    // context.read<ShoppingListBloc>().add(
    //       AddRecipeToShoppingList(
    //         shoppingRecipeItem: ShoppingRecipeItem(
    //           name: recipe.name,
    //           ingredients: recipe.ingredients,
    //           description: recipe.description,
    //           steps: recipe.steps,
    //           checked: false,
    //         ),
    //         shoppingList: shoppingList,
    //       ),
    //     );
  }

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
                addRecipeToShoppingList(context, recipe);
              },
            ),
          ],
        ),
      ),
    );
  }
}
