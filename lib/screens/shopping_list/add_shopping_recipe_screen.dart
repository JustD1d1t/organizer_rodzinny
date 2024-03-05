// import "package:flutter/material.dart";
// import 'package:organizer_rodzinny/data/dummy_data.dart';
// import 'package:organizer_rodzinny/widgets/shopping_list/recipe_item_to_shopping_list.dart';

// class AddShoppingRecipeScreen extends StatelessWidget {
//   AddShoppingRecipeScreen({super.key});

//   static const id = "add_shopping_recipe_screen";

//   final recipes = availableRecipes;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dodaj posiłek do listy zakupowej"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: ListView.separated(
//           itemCount: recipes.length,
//           itemBuilder: (ctx, index) {
//             return RecipeItemToShoppingList(
//               recipe: recipes[index],
//             );
//           },
//           separatorBuilder: (context, index) => const SizedBox(
//             height: 10,
//           ),
//         ),
//       ),
//     );
//   }
// }
