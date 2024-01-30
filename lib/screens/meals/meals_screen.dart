import "package:flutter/material.dart";
import "package:organizer_rodzinny/data/dummy_data.dart";
import "package:organizer_rodzinny/models/meal.dart";
import "package:organizer_rodzinny/screens/meals/add_meal_screen.dart";
import "package:organizer_rodzinny/widgets/meals/meals_list.dart";

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final List<Meal> meals = availableMeals;
  void onRemoveMeal(Meal meal) {
    setState(() {
      meals.remove(meal);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Przepis ${meal.name} został usunięty'),
        duration: const Duration(seconds: 3),
        // action: SnackBarAction(
        //   label: 'Undo',
        //   onPressed: () {
        //     setState(() {
        //       _registeredExpenses.insert(
        //         expenseIndex,
        //         expense,
        //       );
        //     });
        //   },
        // ),
      ),
    );
  }

  void addMeal(Meal meal) {
    setState(() {
      meals.add(meal);
    });
  }

  void _openAddMealScreen(BuildContext context) async {
    final meal = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddMealScreen(),
      ),
    );

    if (meal.name != null) {
      setState(() {
        meals.add(meal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posiłki"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _openAddMealScreen(context);
            },
          ),
        ],
      ),
      body: MealsList(meals: meals, onRemoveMeal: onRemoveMeal),
    );
  }
}
