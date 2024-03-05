// import "package:flutter/material.dart";
// import "package:organizer_rodzinny/blocs/bloc_exports.dart";
// import "package:organizer_rodzinny/models/recipe.dart";

// class RecipeItemToShoppingList extends StatelessWidget {
//   const RecipeItemToShoppingList({
//     super.key,
//     required this.recipe,
//   });

//   final Recipe recipe;

//   void addRecipeToShoppingList(BuildContext context, Recipe recipe) {
//     final shoppingListId =
//         context.read<AppStateBloc>().state.currentShoppingListId;
//     context.read<ShoppingListBloc>().add(
//           AddRecipeToShoppingList(
//             shoppingRecipeItem: ShoppingRecipeItem(
//               name: recipe.name,
//               ingredients: recipe.ingredients,
//               checked: false,
//             ),
//             shoppingListId: shoppingListId,
//           ),
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//       ),
//       child: ListTile(
//         title: Text(recipe.name),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 addRecipeToShoppingList(context, recipe);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
