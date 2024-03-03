// import "package:flutter/material.dart";
// import "package:organizer_rodzinny/blocs/bloc_exports.dart";
// import "package:organizer_rodzinny/models/recipe.dart";
// import "package:organizer_rodzinny/screens/shopping_list/shopping_list_receipe_ingredients.dart";

// class ShoppingListSingleRecipe extends StatefulWidget {
//   const ShoppingListSingleRecipe({
//     super.key,
//     required this.recipe,
//     required this.shoppingListId,
//   });

//   final ShoppingRecipeItem recipe;
//   final String shoppingListId;

//   @override
//   State<ShoppingListSingleRecipe> createState() =>
//       _ShoppingListSingleRecipeState();
// }

// class _ShoppingListSingleRecipeState extends State<ShoppingListSingleRecipe> {
//   void openRecipe(ShoppingRecipeItem recipe) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => ShoppingListReceipeIngredients(
//           recipe: recipe,
//           appBarTitle: recipe.name,
//         ),
//       ),
//     );
//   }

//   void removeRecipe() {
//     context.read<ShoppingListBloc>().add(
//           RemoveRecipeFromShoppingList(
//             shoppingRecipeItem: widget.recipe,
//             shoppingListId: widget.shoppingListId,
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
//       child: InkWell(
//         onTap: () {
//           openRecipe(widget.recipe);
//         },
//         child: ListTile(
//           title: Text(widget.recipe.name),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Checkbox(
//                 value: widget.recipe.checked,
//                 onChanged: (bool? value) {},
//               ),
//               IconButton(
//                 icon: const Icon(Icons.delete),
//                 onPressed: removeRecipe,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
