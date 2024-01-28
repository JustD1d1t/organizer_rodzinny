import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/meal.dart";

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              meal.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Składniki",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ...meal.ingredients.map(
              (ingredient) => ListTile(
                leading: const Icon(Icons.arrow_right),
                title: Text(ingredient),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Kroki",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ...meal.steps.map(
              (step) => ListTile(
                leading: const Icon(Icons.arrow_right),
                title: Text(step),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
