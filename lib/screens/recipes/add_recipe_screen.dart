import "package:flutter/material.dart";
import 'package:organizer_rodzinny/models/recipe.dart';
import 'package:organizer_rodzinny/screens/recipes/add_recipe_from_url_screen.dart';
import "package:organizer_rodzinny/widgets/recipes/add_ingredient.dart";

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  var _mealName = "";
  var _mealDescription = "";
  var _mealIngredients = [];
  var _mealSteps = [];

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    Navigator.of(context).pop(
      Recipe(
        name: _mealName,
        description: _mealDescription,
        ingredients: _mealIngredients,
        steps: _mealSteps,
      ),
    );
  }

  void openAddIngredient() async {
    final ingredient = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddIngredient(),
    );
    if (ingredient != null) {
      setState(() {
        _mealIngredients.add(ingredient);
      });
    }
  }

  void openAddStep() async {
    final step = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddIngredient(),
    );
    if (step != null) {
      setState(() {
        _mealSteps.add(step);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void openRecipeFromURL() async {
      final recipe = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const AddRecipeFromUrlScreen(),
        ),
      );

      if (recipe != null) {
        print(recipe.name);
        print(recipe.ingredients);
        print(recipe.steps);
        Navigator.of(context).pop(recipe);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj posiłek"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Nazwa"),
                    maxLength: 30,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 5 ||
                          value.trim().length > 30) {
                        return 'Must be between 5 and 30 characters.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _mealName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Opis"),
                    maxLength: 100,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 5 ||
                          value.trim().length > 50) {
                        return 'Must be between 5 and 50 characters.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _mealDescription = value!;
                    },
                  ),
                  if (_mealIngredients.isNotEmpty)
                    Column(
                      children: [
                        const Text("Składniki"),
                        ..._mealIngredients.map(
                          (ingredient) => ListTile(
                            title: Text(ingredient),
                          ),
                        ),
                      ],
                    ),
                  if (_mealSteps.isNotEmpty)
                    Column(
                      children: [
                        const Text("Kroki"),
                        ..._mealSteps.map(
                          (step) => ListTile(
                            title: Text(step),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: openAddIngredient,
                        child: Text('Dodaj składnik'),
                      ),
                      TextButton(
                        onPressed: openAddStep,
                        child: Text('Dodaj krok'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _saveForm,
                        child: const Text("Zapisz"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  openRecipeFromURL();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                ),
                child: const Text("Dodaj przepis z ze strony internetowej"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
