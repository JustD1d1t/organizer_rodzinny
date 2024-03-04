// import "package:flutter/material.dart";
// import "package:organizer_rodzinny/data/dummy_data.dart";
// import 'package:organizer_rodzinny/models/recipe.dart';
// import "package:organizer_rodzinny/screens/recipes/add_recipe_screen.dart";
// import "package:organizer_rodzinny/widgets/recipes/recipes_list.dart";

// class RecipesScreen extends StatefulWidget {
//   const RecipesScreen({super.key});

//   static const id = "recipes_screen";

//   @override
//   State<RecipesScreen> createState() => _RecipesScreenState();
// }

// class _RecipesScreenState extends State<RecipesScreen> {
//   final List<Recipe> recipes = availableRecipes;
//   void onRemoveMeal(Recipe recipe) {
//     setState(() {
//       recipes.remove(recipe);
//     });
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Przepis ${recipe.name} został usunięty'),
//         duration: const Duration(seconds: 3),
//         // action: SnackBarAction(
//         //   label: 'Undo',
//         //   onPressed: () {
//         //     setState(() {
//         //       _registeredExpenses.insert(
//         //         expenseIndex,
//         //         expense,
//         //       );
//         //     });
//         //   },
//         // ),
//       ),
//     );
//   }

//   void addRecipe(Recipe recipe) {
//     setState(() {
//       recipes.add(recipe);
//     });
//   }

//   void _openAddRecipeScreen(BuildContext context) async {
//     final meal = await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => const AddRecipeScreen(),
//       ),
//     );

//     if (meal.name != null) {
//       setState(() {
//         recipes.add(meal);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Przepisy"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               _openAddRecipeScreen(context);
//             },
//           ),
//         ],
//       ),
//       body: RecipesList(recipes: recipes, onRemoveMeal: onRemoveMeal),
//     );
//   }
// }
