// import "dart:core";

// import 'package:beautiful_soup_dart/beautiful_soup.dart';
// import "package:flutter/material.dart";
// import 'package:http/http.dart' as http;
// import 'package:organizer_rodzinny/models/Ingredient.dart';
// import 'package:organizer_rodzinny/models/recipe.dart';
// import 'package:organizer_rodzinny/widgets/recipes/add_recipe_ingredient.dart';

// class AddRecipeFromUrlScreen extends StatefulWidget {
//   const AddRecipeFromUrlScreen({super.key});

//   static const id = "add_recipe_from_url_screen";

//   @override
//   State<AddRecipeFromUrlScreen> createState() => _AddRecipeFromUrlScreenState();
// }

// class _AddRecipeFromUrlScreenState extends State<AddRecipeFromUrlScreen> {
//   final _formKey = GlobalKey<FormState>();

//   var _recipeURL = "";

//   List<ShoppingRecipeIngredient> ingredients = [];
//   var recipeName = "";

//   void _saveForm() async {
//     final isValid = _formKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _formKey.currentState!.save();

//     final response = await http.get(Uri.parse(_recipeURL));
//     if (response.statusCode == 200) {
//       BeautifulSoup bs = BeautifulSoup(response.body);
//       final title = bs.find('h1', attrs: {'class': 'title'})!.text;
//       final allIngredients =
//           bs.findAll('div', attrs: {'class': 'ingredients-list-content-item'});
//       RegExp exp = RegExp(r'(\D+)(\d+)(\D+)');
//       setState(() {
//         recipeName = title;
//       });
//       allIngredients.forEach((element) {
//         RegExpMatch regExpMatch = exp.firstMatch(element.text)!;
//         final name = regExpMatch.group(1);
//         final amount = regExpMatch.group(2);
//         final unit = regExpMatch.group(3);
//         setState(() {
//           ingredients.add(
//             ShoppingRecipeIngredient(
//               name: name.toString(),
//               amount: double.parse(amount!),
//               unit: unit.toString(),
//               checked: false,
//             ),
//           );
//         });
//       });
//     }
//   }

//   void addRecipeToList(List<Ingredient> ingredients, String name) {
//     final newRecipe = Recipe(
//       name: recipeName,
//       ingredients: ingredients,
//     );
//     Navigator.of(context).pop(newRecipe);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dodaj posiłek z URL"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(8),
//         child: Column(
//           children: [
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration:
//                         const InputDecoration(labelText: "Link do przepisu"),
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           value.trim().length <= 5) {
//                         return 'Must be at least 5 characters.';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _recipeURL = value!;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ElevatedButton(
//                         onPressed: _saveForm,
//                         child: const Text("Pobierz składniki"),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             if (ingredients.isNotEmpty)
//               const SizedBox(
//                 height: 10,
//               ),
//             if (recipeName.trim() != "")
//               Text(
//                 recipeName,
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//             const SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: ListView.separated(
//                 itemCount: ingredients.length,
//                 itemBuilder: (context, index) => AddRecipeIngredient(
//                   ingredient: ingredients[index],
//                 ),
//                 separatorBuilder: (context, index) => const SizedBox(
//                   height: 10,
//                 ),
//               ),
//             ),
//             if (ingredients.isNotEmpty)
//               const SizedBox(
//                 height: 10,
//               ),
//             if (ingredients.isNotEmpty)
//               ElevatedButton(
//                 onPressed: () {
//                   addRecipeToList(ingredients, recipeName);
//                 },
//                 child: const Text("Dodaj posiłek do swojej listy"),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
