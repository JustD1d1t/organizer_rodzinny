import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/meal.dart";
import "package:organizer_rodzinny/widgets/meals/add_ingredient.dart";

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
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
    print(_mealName);
    print(_mealDescription);
    print(_mealIngredients);
    print(_mealSteps);

    Navigator.of(context).pop(
      Meal(
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
    print(step);
    if (step != null) {
      setState(() {
        _mealSteps.add(step);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj posiłek"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
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
      ),
    );
  }
}
